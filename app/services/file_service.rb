require 'csv'
class FileService < Struct.new(:file)
  def parse_csv
    data = CSV.read(file, {headers: true}).map{|data| [data[2], data[4], data[5], data[6], data[7].gsub("(", "").gsub(")", ""), data[12]]}
  end
end
