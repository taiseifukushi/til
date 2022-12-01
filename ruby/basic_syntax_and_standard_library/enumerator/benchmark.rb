require "benchmark"

# not use lazy
def add_not_use_lazy(a, b)
  lambda do
    a + b
  end
end

# use lazy
def add_use_lazy(a, b)
  memo = nil
  lambda do
    return memo if memo
    memo = a + b
  end
end

def execute_not_use_lazy
  fib = Enumerator.new do |yielder|
    a = b = lambda { 1 }
    
    loop do
      yielder << a
      a = b
      b = add_not_use_lazy(a, b) 
    end
  end

  fib.take(36).each do |i|
    i
  end
end

def execute_use_lazy
  fib = Enumerator.new do |yielder|
    a = b = lambda { 1 }
    
    loop do
      yielder << a
      a = b
      b = add_use_lazy(a, b) 
    end
  end

  fib.take(36).each do |i|
    i
  end
end

Benchmark.bm(10) do |r|
  r.report "not use lazy" do
    execute_not_use_lazy
  end
  r.report "use lazy" do
    execute_use_lazy
  end
end
