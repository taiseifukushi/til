# ケーキをつくる手順のプログラム

# 1. 基底クラス (抽象クラス)
class Task
  attr_reader :name

  def initialize(name)
    @name = name
  end
  
  def get_time_required
    0.0
  end
end

# 2. leafクラス
class AddDryIngredientsTask < Task
  def initialize
    super("Add Dry Ingredients Task")
  end
  
  def get_time_required
    1.0
  end
end

class MixTask < Task
  def initialize
    super("Mix Task")
  end
  
  def get_time_required
    3.0
  end
end

# 3. Composite
# MakeBatterTaskは、他の子タスクから構成されている
# Composite Taskの詳細を、別の基底クラスに移す
# CompositeTaskを作ることで、MakeBatterTaskクラスを小さくできる
class CompositeTask < Task
  def initialize(name)
    super(name)
    @sub_task = []
    add_sub_task()
  end
  
  def add_sub_task(task)
    @sub_task << task
  end
  
  def remove_sub_task(task)
    @sub_task.delete(task)
  end
  
  def get_time_required
    time = 0.0
    @sub_task.each do |task|
      time += task.get_time_required
    end
  end
end

class MakeBatterTask < CompositeTask
  def initialize
    super("Make Batter")
    @sub_task = []
    add_sub_task(AddDryIngredientsTask.new)
    add_sub_task(MixTask.new)
  end
end