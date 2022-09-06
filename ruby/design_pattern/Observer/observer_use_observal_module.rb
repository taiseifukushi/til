# https://docs.ruby-lang.org/ja/latest/class/Observable.html
# >Observer パターンを提供するモジュールです。
# Mix-in により Observer パターンを提供します。
# Observable モジュールを include したクラスは Observable#changed メソッドにより更新フラグを立て、
# Observable#notify_observers が呼び出されると更新フラグが立っている場合はオブザーバに通知します
# (オブザーバの update メソッドを呼び出す)。 Observable#notify_observers の引数はそのままオブザーバの update メソッドに渡されます。

require "observer"

# module Subject
#   def initialize
#     @observer = []
#   end

#   def add_observer(observer)
#     @observer << observer
#   end
  
#   def delete_observer(observer)
#     @observer.delete(observer)
#   end

#   def notify_observer(observer)
#     @observer.each do |observer|
#       observer.update(self)
#     end
#   end
end

class Employee
  include Observable
  attr_reader :name, :address, :salary
  
  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(new_saraly)
    @salary = new_saraly
    # https://docs.ruby-lang.org/ja/latest/method/Observable/i/changed.html
    # Observable#changed
    # 更新フラグを立てます。
    # 更新フラグを指定された内容へ変更し、変更後の更新フラグの状態を返します。
    # 明示的に引数を指定して、更新フラグを初期化することも出来ます。
    changed
    # https://docs.ruby-lang.org/ja/latest/method/Observable/i/notify_observers.html
    # Observable#notify_observers
    # 更新フラグが立っていた場合は、登録されているオブザーバの update メソッドを順次呼び出します。
    # 与えられた引数はその update メソッドに渡されます。
    # 与えられた引数の数と登録されているオブザーバのupdate メソッドの引数の数に違いがある場合は例外ArgumentErrorを発生します。
    # 全てのオブザーバの update メソッドを呼び出し後、更新フラグを初期化します。
    notify_observers(self)
  end
end