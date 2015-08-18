require 'csv'

# 匯入選區資料
CSV.foreach("#{Rails.root}/taiwan_districts.csv", headers: false) do |row|
  city_data = row[1][0..2]
  district_data = row[1][3..6].strip
  city = City.find_or_create_by(name: city_data)
  district = city.districts.create(name: district_data)
  puts "#{city.id}-#{city.name}:#{district.city.name}-#{district.name}"
end

# 匯入問題指標
["問政專業", "價值立場", "問題解決", "問政態度與技巧"].each do |name|
  QuestionType.create(name: name)
end
