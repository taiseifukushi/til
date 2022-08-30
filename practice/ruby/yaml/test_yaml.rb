require "yaml"
data = { "key1" => [], "key2" => nil}

def memo
  "memo"
end

3.times do |n|
  data["key2"] = memo
  data["key1"] << n
end

YAML.dump(data, File.open("sample.yml", "w"))
p data.class