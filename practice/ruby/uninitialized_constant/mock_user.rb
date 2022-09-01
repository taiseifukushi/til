# frozen_string_literal: true

def test
  p "test"
end

def test2
  p "test2"
end

def test3
  1 + 2
end

class MockUser
  # include Service
  include Name::Service
  # prepend Service
  # extend Service
  # USER = 1
  attr_accessor :name, :age
  # attr_reader :name, :age
  # def initialize(name, age)
  def initialize(name = "taro", age = 20)
    @name = name
    @age = age
  end
end

p MockUser.ancestors 

user1 = MockUser.new
user2 = MockUser.new("jiro", 11)
p user1.name
# p user1.hello
p user2.name
# p user2.hello

def mymethod
  p "#{test}, #{test2}, #{test3}"
end

p mymethod

# ➜  uninitilize_constant git:(main) ✗ be ruby mock_user.rb
# mock_user.rb:16:in `<class:MockUser>': uninitialized constant MockUser::Service (NameError)

#   include Service
#           ^^^^^^^
#         from mock_user.rb:15:in `<main>'
# 出た
# これを解決したい

# https://docs.ruby-lang.org/ja/latest/method/Module/i/include.html
