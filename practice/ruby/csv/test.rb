# https://docs.ruby-lang.org/ja/latest/class/CSV.html
# https://docs.ruby-lang.org/ja/latest/library/csv.html
require "csv"
require "pry"

item_changed_csv_path = "item_changed.csv"
base_csv_path         = "base.csv"
base_updated_csv_path = "base_updated.csv"
item_changed_csv      = CSV.read(item_changed_csv_path, headers: true)
base_csv              = CSV.read(base_csv_path, headers: true)
header                = ["key", "value" , "arg1", "arg2", "arg3"]

CSV.open(base_updated_csv_path, "w") do |csv|
  csv << header
  base_csv.each do |base_csv_row|
    match_row = item_changed_csv.select do |item_changed_csv_row|
      item_changed_csv_row["key"] == base_csv_row["key"]
    end

    unless match_row.empty?
      base_csv_row["value"] = match_row[0]["value"]
    end

    csv << base_csv_row
  end
  p "successed."
  p csv
end
