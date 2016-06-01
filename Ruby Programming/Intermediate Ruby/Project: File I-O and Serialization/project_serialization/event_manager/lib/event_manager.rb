puts "EventManager initialized."

# contents = File.read "event_attendees.csv"
# puts contents
# p File.exist? "event_attendees.csv"

# lines = File.readlines "event_attendees.csv"
# lines.each do |line|
# 	puts line
# end

# lines = File.readlines "event_attendees.csv"
# lines.each do |line|
# 	columns = line.split(",")
# 	name = columns[2]
# 	puts name
# end

# lines = File.readlines "event_attendees.csv"
# row_index = 0
# lines.each do |line|
# 	row_index += 1
# 	next if row_index == 1
# 	columns = line.split(",")
# 	name = columns[2]
# 	puts name
# end

# lines = File.readlines "event_attendees.csv"
# lines.each_with_index do |line, index|
# 	next if index == 0
# 	columns = line.split(",")
# 	name = columns[2]
# 	puts name
# end

# require 'csv'
# contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
# contents.each do |row|
# 	name = row[:first_name]
# 	puts name
# end

# require 'csv'
# contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
# contents.each do |row|
# 	name = row[:first_name]
# 	zipcode = row[:zipcode]
# 	puts "#{name} #{zipcode}"
# end

# require 'csv'
# contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
# contents.each do |row|
# 	name = row[:first_name]
# 	zipcode = row[:zipcode]

# 	if zipcode.nil?
# 		zipcode = "00000"
# 	# if the zipcode is exactly five digits, assume that it is ok
# 	elsif zipcode.length  < 5
# 		zipcode = zipcode.rjust(5, "0")
# 	# if the zipcode is more than 5 digits, truncate it to the first five digits
# 	elsif zipcode.length > 5
# 		zipcode = zipcode[0..4]
# 	# if the zipcode is less than 5 digits, add zeros to the front until it becomes five digits
# 	end

# 	puts "#{name} #{zipcode}"
# end

# require 'csv'

# def clean_zipcode(zipcode)	
# 	if zipcode.nil?
# 		zipcode = "00000"
# 	# if the zipcode is exactly five digits, assume that it is ok
# 	elsif zipcode.length  < 5
# 		zipcode = zipcode.rjust(5, "0")
# 	# if the zipcode is more than 5 digits, truncate it to the first five digits
# 	elsif zipcode.length > 5
# 		zipcode = zipcode[0..4]
# 	# if the zipcode is less than 5 digits, add zeros to the front until it becomes five digits
# 	end
# end
# contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
# contents.each do |row|
# 	name = row[:first_name]
# 	zipcode = clean_zipcode(row[:zipcode])
# 	puts "#{name} #{zipcode}"
# end

# require 'csv'

# def clean_zipcode(zipcode)	
# 	zipcode.to_s.rjust(5, "0")[0..4]
# end
# contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
# contents.each do |row|
# 	name = row[:first_name]
# 	zipcode = clean_zipcode(row[:zipcode])
# 	puts "#{name} #{zipcode}"
# end

# require 'csv'
# require 'sunlight/congress'

# Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

# def clean_zipcode(zipcode)
# 	zipcode.to_s.rjust(5, "0")[0..4]
# end

# contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

# contents.each do |row|
# 	name = row[:first_name]
# 	zipcode = clean_zipcode(row[:zipcode])
# 	legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
# 	# puts "#{name} #{zipcode} #{legislators}"

# 	legislator_names = legislators.collect do |i|
# 		"#{i.first_name} #{i.last_name}"
# 	end
# 	legislators_string = legislator_names.join(", ")
# 	puts "#{name} #{zipcode} #{legislators_string}"
# end

# require 'csv'
# require 'sunlight/congress'

# Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

# def clean_zipcode(zipcode)
# 	zipcode.to_s.rjust(5, "0")[0..4]
# end

# def legislators_by_zipcode(zipcode)
# 	legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)

# 	legislator_names = legislators.collect do |i|
# 		"#{i.first_name} #{i.last_name}"
# 	end
# 	legislator_names.join(", ")
# end

# contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

# # contents.each do |row|
# # 	name = row[:first_name]
# # 	zipcode = clean_zipcode(row[:zipcode])
# # 	legislators_string = legislators_by_zipcode(zipcode)
# # 	puts "#{name} #{zipcode} #{legislators_string}"
# # end

# template_letter = File.read "form_letter.html"
# contents.each do |row|
# 	name = row[:fisrt_name]
# 	zipcode = clean_zipcode(row[:zipcode])
# 	legislators = legislators_by_zipcode(zipcode)

# 	personal_letter = template_letter.gsub('FIRST_NAME',name)
# 	personal_letter.gsub!('LEGISLATORS',legislators)

# 	puts personal_letter
# end

# require 'erb'

# meaning_of_life = 42
# question = "The answer to the Ultimate Question of Life, the Universe, and Everything is <%= meaning_of_life %>"
# template = ERB.new(question)
# puts template
# results = template.result(binding)
# puts results

# require 'csv'
# require 'sunlight/congress'
# require 'erb'

# Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

# def clean_zipcode(zipcode)
# 	zipcode.to_s.rjust(5, "0")[0..4]
# end

# def legislators_by_zipcode(zipcode)
# 	Sunlight::Congress::Legislator.by_zipcode(zipcode)
# end

# contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
# template_letter = File.read "form_letter.erb"
# erb_template = ERB.new(template_letter)

# contents.each do |row|
# 	id = row[0]
# 	name = row[:first_name]
# 	zipcode = clean_zipcode(row[:zipcode])
# 	legislators = legislators_by_zipcode(zipcode)
# 	form_letter = erb_template.result(binding)

# 	Dir.mkdir("output") unless Dir.exists? "output"
# 	filename = "output/thanks_#{id}.html"

# 	File.open(filename, 'w') do |file|
# 		file.puts(form_letter)
# 	end

# 	# puts form_letter
# end

require 'csv'
require 'sunlight/congress'
require 'erb'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
	zipcode.to_s.rjust(5, "0")[0..4]
end

def legislators_by_zipcode(zipcode)
	Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letter(id, form_letter)
	Dir.mkdir("output") unless Dir.exists?("output")
	filename = "output/thanks_#{id}.html"
	File.open(filename, 'w') do |file|
		file.puts(form_letter)
	end
end

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
template_letter = File.read("form_letter.erb")
erb_template = ERB.new(template_letter)

contents.each do |row|
	id = row[0]
	name = row[:first_name]
	zipcode = clean_zipcode(row[:zipcode])
	legislators = legislators_by_zipcode(zipcode)
	form_letter = erb_template.result(binding)
	save_thank_you_letter(id, form_letter)
end
