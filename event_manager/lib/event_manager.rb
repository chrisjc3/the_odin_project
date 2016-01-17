#Kept examples of 'more than one ways to do it' in Ruby
require 'sunlight/congress'
require 'csv'
require 'erb'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
#does below in one liner
	zipcode.to_s.rjust(5,"0")[0..4]
  # if zipcode.nil?
  # 	zipcode = "00000"
  # elsif zipcode.length < 5
  # 	#.rjust pads with text to designated length
  #   zipcode = zipcode.rjust 5, "0"
  # elsif zipcode.length > 5
  # 	#takes the 5 characters 
  #   zipcode = zipcode[0..4]
  # end
end
def legislators_by_zipcode(zipcode)
	# legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
	# legislator_names = legislators.collect do |legislator|
	# 	"#{legislator.first_name} #{legislator.last_name}"
	# end
	# legislator_names.join(", ")
		#Changed to work with .erb templates (but increased elegance)
	Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letters(id,form_letter)
	Dir.mkdir("output") unless Dir.exists?("output")
	filename = "output/thanks_#{id}.html"
	File.open(filename,'w') do |file|
	file.puts form_letter
	end
end

puts "EventManager Initialized!"



#contents = File.read "event_attendees.csv"
#puts contents

# lines = File.readlines "event_attendees.csv"
# lines.each_with_index do |line, index|
# 	next if index == 0
# 	columns = line.split(",")
# 	name = columns[2]
# 	puts name
# end

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
	id = row[0]
	name = row[:first_name]
	zipcode = clean_zipcode(row[:zipcode])
	legislators = legislators_by_zipcode(zipcode)
	form_letter = erb_template.result(binding)
	save_thank_you_letters(id,form_letter)
end


