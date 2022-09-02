# https://docs.ruby-lang.org/ja/latest/class/CSV.html
require "csv"

changed_item_csv_path = "changed_item.csv"
base_csv_path         = "base.csv"
# options = { headers: true, return_headers: true, write_headers: true }

changed_item_csv = CSV.read(changed_item_csv_path, headers: true) # => Array
base_csv   = CSV.read(base_csv_path, headers: true) # => Array# => Array

# changed_item_csv.each do |row|
#   p row
#   p row.class
#   p row["key"]
# end

base_csv.each do |base_csv_row|
  changed_item_csv.each do |changed_item_csv_row|
    if base_csv_row["key"] == changed_item_csv_row["key"]
      p "matched."
      p changed_item_csv_row["key"]
    end
  end
end

p "==="

base_csv.each do |base_csv_row|
  changed_item_csv.each do |changed_item_csv_row|
    if base_csv_row["key"] == changed_item_csv_row["key"]
      p "matched."
      p changed_item_csv_row["key"]
    end
  end
end


