# `define_method`
HASH = { cat: 'にゃー', dog: 'わん' }

class Animal
    HASH.each do |name, message|
    define_method(name) do
      message
    end
  end
end

puts Animal.new.cat

class Animal2
    HASH.each do |name, message|
        define_method(name) do |num|
            message * num
        end
    end
end

puts Animal2.new.dog(2)


class Animal3
end

HASH.each do |name, message|
    proc = Proc.new { |num| message * num }
    Animal3.class_eval { define_method(name, proc) }
end

puts Animal3.new.cat(3)

class Animal4
end

HASH.each do |name, message|
    proc = lambda { |num| message * num }
    Animal4.class_eval { define_method(name, proc) }
end

puts Animal4.new.cat(3)

## `instance_eval`
## `class_eval`
## `included`