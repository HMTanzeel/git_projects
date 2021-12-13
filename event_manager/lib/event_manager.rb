# require 'byebug'
# puts 'Event Manager Initialized'

# contents = File.read('lib/event_attendees.csv')

# puts contents

# ---------------------------------------------------- #

# puts 'Event Manager Initialized'

# lines = File.readlines('lib/event_attendees.csv')

# lines.each_with_index do |line,index|

#     next if index == 0 #skip the first row
#     columns = line.split(",")
#     name = columns[2]
#     puts name

# end

# ------------------------------------------------------- #

# require 'csv'

# puts 'Event Manager Initialized'

# contents = CSV.open('lib/event_attendees.csv', headers: true)

# contents.each do |row|
   
#     name = row[2]
#     puts name

# end

# ------------------------------------------------------- #


# def clean_zipcode (zip)
#     # zip.length < 5 ? zip = zip.rjust('5','0')  : zip = zip
#     if zip.nil?
#         '00000'
    
#     elsif zip.length < 5
#         zip = zip.to_s.rjust(5, '0')
    
#     elsif zip.length > 5
#         zip = zip.to_s[0..4]
    
#     else
#         zip
#     end
    
# end


require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

def legislators_by_zipcode(zip)

    civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
    civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

    begin
        legislators = civic_info.representative_info_by_address(
            address: zip,
            levels: 'country',
            roles: ['legislatorUpperBody', 'legislatorLowerBody']
        )

            legislators = legislators.officials

            legislators_name = legislators.map(&:name)

            legislators_string = legislators_name.join(", ")

    rescue
        'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
    end


end

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def save_thank_you_letter(id, form_letter)

    Dir.mkdir('output') unless Dir.exist?('output')

    filename = "output/thanks_#{id}.html"

    File.open(filename, 'w') do |file|
        file.puts form_letter
       end

    end


puts 'Event Manager Initialized'

contents = CSV.open(
    'lib/event_attendees.csv',
    headers: true,
    header_converters: :symbol
    )

    template_letter = File.read('/home/tazneel/event_manager/lib/form_letter.erb')
    erb_template = ERB.new template_letter

contents.each do |row|

    id = row[0]
   
    name = row[:first_name]

    zipcode = clean_zipcode(row[:zipcode])

    legislators = legislators_by_zipcode(zipcode)

    form_letter = erb_template.result(binding)

    save_thank_you_letter(id,form_letter)

end
