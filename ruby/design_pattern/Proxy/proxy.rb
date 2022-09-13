# https://docs.ruby-lang.org/ja/latest/class/Etc.html
# PCのログインユーザーを取得する
require "etc"
require "yaml"

class BankAccount
  attr_reader :balance

  def initialize(balance)
    @balance = balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end

class BankAccountProxy
  def initialize(real_object, owner_name)
    @real_object = real_object
    @owner_name = owner_name
  end

  def balance
    check_access
    @real_object.balance
  end

  def deposit(amount)
    check_access
    @real_object.deposit(amount)
  end

  def withdraw(amount)
    check_access
    @real_object.withdraw(amount)
  end

  def check_access
    if(Etc.getlogin != @owner_name)
      raise "Illegal access: #{@owner_name} cannot access account."
    end
  end
end

path = "../secret.yaml"
user = YAML.load_file(path)["secret"]["user"]
dammy_user = "dammy_user"

account = BankAccount.new(100)
proxy = BankAccountProxy.new(account, user)
p proxy.deposit(50)
p proxy.withdraw(10)
# proxy.rb:45:in `check_access': Illegal access: tfukushi cannot access account. (RuntimeError)
#         from proxy.rb:34:in `deposit'
#         from proxy.rb:56:in `<main>'

# account = BankAccount.new(100)
# proxy = BankAccountProxy.new(account, dammy_user)
# p proxy.deposit(50)
# proxy.rb:45:in `check_access': Illegal access: tfukushi cannot access account. (RuntimeError)
#         from proxy.rb:34:in `deposit'
#         from proxy.rb:57:in `<main>'

# bundle exec ruby proxy.rb