require "yaml"

data = { "key1" => [], "key2" => nil}
def memo
  "memo"
end

3.times do |n|
  data["key2"] = memo
  data["key1"] << n
end

data

YAML.dump(data, File.open("./test.yaml", "w"))
p data.class
p YAML.load_file("./test.yaml")
