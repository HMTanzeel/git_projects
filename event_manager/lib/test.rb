lines = File.readlines('event_attendees.csv')
i=0
lines.each do |line|
    i=i+1
    next if i == 1
        col = line.split(",")
        puts col[2]
end