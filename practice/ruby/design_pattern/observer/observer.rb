module Subject
  def initialize
    @observer = []
  end

  def add_observer(observer)
    @observer << observer
  end
  
  def delete_observer(observer)
    @observer.delete(observer)
  end

  def notify_observers(observer)
    @observer.each do |observer|
      observer.update(self)
    end
  end
end

class Employee
  include Subject
  attr_reader :name, :address, :salary
  
  def initialize(name, title, salary)
    super()
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(new_saraly)
    @salary = new_saraly
    notify_observers
  end
end