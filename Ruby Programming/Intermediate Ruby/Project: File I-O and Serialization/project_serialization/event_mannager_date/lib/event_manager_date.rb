require 'csv'
require 'date'
require 'sunlight/congress'
require 'erb'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
	zipcode.to_s.rjust(5, "0")[0..4]
end

def legislators_by_zipcode(zipcode)
	Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thankyou_letter(id,form_letter)
	Dir.mkdir("output") unless Dir.exists?("output")
	filename = "output/thankyou_#{id}.html"
	File.open(filename, 'w') do |file|
		file.puts(form_letter)
	end
end

def peak_hours(all_hours)
	puts "PEAK HOURS"
	total = all_hours.values.inject(0) {|sum, i| sum + i}
	peak_hours = all_hours.sort_by {|k, v| v}.reverse.first(3)
	peak_hours.each do |hour, count|
		puts "hour: #{hour} count: #{count} (#{(count.to_f / total * 100).round(1)}%)"
	end
end

def peak_days(days_of_week)
	puts "PEAK DAYS"
	total = days_of_week.values.inject(0){|sum, i| sum+i}
	sorted_days = days_of_week.sort_by{|k,v| v}.reverse
	sorted_days.each do |hour, count|
		puts "#{hour}:".rjust(10, ' ') + " #{count.to_s.rjust(4, ' ')} (#{(count.to_f/total*100).round(1)}%)"
	end
end

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
erb_template = File.read('erb_letter.erb')
erb_letter = ERB.new(erb_template)

all_hours = Hash.new(0)
days_of_week = Hash.new(0)

contents.each do |row|
	id = row[0]
	name = row[:first_name]
	zipcode = clean_zipcode(row[:zipcode])
	legislators = legislators_by_zipcode(zipcode)
	form_letter = erb_letter.result(binding)
	save_thankyou_letter(id,form_letter)
	reg_date = DateTime.strptime(row[:regdate], '%m/%d/%y %H:%M')

	all_hours[reg_date.hour] += 1
	days_of_week[reg_date.strftime('%A')] += 1

end
puts "\n"
peak_hours(all_hours)
peak_days(days_of_week)
