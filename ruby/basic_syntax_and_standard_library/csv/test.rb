# https://docs.ruby-lang.org/ja/latest/class/CSV.html
# https://docs.ruby-lang.org/ja/latest/library/csv.html

class CsvGenerator
  require "csv"
  require "pry"

  attr_reader :item_changed_csv_path, :base_csv_path, :base_updated_csv_path

  def initialize
    @item_changed_csv_path = "item_changed.csv"
    @base_csv_path         = "base.csv"
    @base_updated_csv_path = "base_updated.csv"
  end

  def generate_csv(&header)
    CSV.open(@base_updated_csv_path, "w") do |csv|
      csv << header.call
      read_csv_file(@base_csv_path).each do |base_csv_row|
        match_row = read_csv_file(@item_changed_csv_path).select do |item_changed_csv_row|
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
  end

  private

  def read_csv_file(path)
    CSV.read(path, headers: true)
  end
end

simple_header = lambda do
  ["key", "value" , "arg1", "arg2", "arg3"]
end
generator = CsvGenerator.new
generator.generate_csv(&simple_header)
