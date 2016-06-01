require 'csv'
require 'sunlight/congress'
require 'erb'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_phone_number(phone_number)
	number = phone_number.to_s.gsub(/\D+/, '')
	if number.length == 10 || (number[0] == "1" && number.length == 11)
		number = number[0..9]
	else 
		number = "000_000_000_0"
	end
	puts number
end

def clean_zipcode(zipcode)
	zipcode.to_s.rjust(5, "0")[0..4]
end

def legislators_by_zipcode(zipcode)
	Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thankyou_letter(id, erb_letter)
	Dir.mkdir("output") unless Dir.exists?("output")
	filename = "output/thankyou_#{id}.html"

	File.open(filename, 'w') do |file|
		file.puts(erb_letter)
	end
end

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
erb_template = File.read("erb_letter.erb")
erb_letter = ERB.new(erb_template)

contents.each do |row|
	id = row[0]
	phone_number = clean_phone_number(row[:homephone])
	name = row[:first_name]
	zipcode = clean_zipcode(row[:zipcode])
	legislators = legislators_by_zipcode(zipcode)
	form_letter = erb_letter.result(binding)
	save_thankyou_letter(id, form_letter)
end


