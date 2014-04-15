require 'csv'
require 'sunlight/congress'
require 'erb'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5" # jumpstart api key
puts 'Event Manager Initiliazed!'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

# gets leglislators by zipcode from sunlight api
def legislators_by_zipcode(zipcode)
  legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

# creates directory of customized thank you letters
def save_thank_you_letters(id, form_letter)
  Dir.mkdir('output') unless Dir.exists? 'output'
  filename = "output/thanks_#{id}.html"
  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end

# formats phone numbers and replaces bad numbers with default
def clean_phone(phone)
  phone = phone.to_s.scan(/\d+/).join
  if phone.length != 10
    if phone.length == 11 && phone[0] = '1'
      phone = phone[1..-1]
    end
    phone = '0000000000'
  end
  phone[0..2] + '-' + phone[3..5] + '-' + phone[6..9]
end

# prints list of hours with most registrants
def peak_hours(all_hours)
  puts "PEAK HOURS:"
  puts "-----------"
  peak_hours = all_hours.sort_by { |key, value| value }.reverse.first(5)
  peak_hours. each { |hour, count| puts "hour: #{hour} count: #{count}" } 
  puts "\n"
end

#prints list of days with # of registrants
def peak_days(days_of_week)
  puts "PEAK DAYS"
  puts "---------"
  sorted_days = days_of_week.sort_by { |k,v| v}.reverse
  sorted_days.each { |i| puts "#{i[0]}:".rjust(10,' ') + " #{i[1]}" }
  puts "\n"
end

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

# template for thank you letters
template_letter = File.read 'form_letter.erb'
erb_template = ERB.new template_letter

all_hours = Hash.new(0) # hash to track peak # of registrants per hour
days_of_week = Hash.new(0) # has to track registrants by day

contents.each do |row|
  # pulls elements from csv file and cleans them for data processing
  id = row[0]
	name = row[:first_name]
	zipcode = clean_zipcode(row[:zipcode])
  phone = clean_phone(row[:homephone])
  reg_date = DateTime.strptime(row[:regdate],'%m/%d/%y %H:%M')

  # counters to keep track of registrants by hour and day
  all_hours[reg_date.hour] += 1
  days_of_week[reg_date.strftime('%A')] += 1

  # pulls legislators and saves thank you letters with table of legislators
  legislators = legislators_by_zipcode(zipcode) 
  form_letter = erb_template.result(binding) 
  save_thank_you_letters(id,form_letter)
end

puts "\n"
peak_hours(all_hours)
peak_days(days_of_week)
