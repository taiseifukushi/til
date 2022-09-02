# https://docs.ruby-lang.org/ja/latest/class/CSV.html
require "csv"
require "pry"

item_changed_csv_path = "item_changed.csv"
base_csv_path         = "base.csv"
base_updated_csv_path  = "base_updated.csv"
item_changed_csv      = CSV.read(item_changed_csv_path, headers: true) # => Array
base_csv              = CSV.read(base_csv_path, headers: true) # => Array# => Array

CSV.open(base_updated_csv_path, "wb") do |csv|
  base_csv.each do |base_csv_row|
    match_row = item_changed_csv.select do |item_changed_csv_row|
      item_changed_csv_row["key"] == base_csv_row["key"]
    end

    unless match_row.empty?
      # binding.pry
      base_csv_row["value"] = match_row[0]["value"]
    end

    csv << base_csv_row
  end
  p "successed."
end
