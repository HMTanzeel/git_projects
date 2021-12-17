# # my_variable = ""
# # my_variable.capitalize()
# my_variable ||= "hi"
# puts my_variable.capitalize()

# ..........................................................

# my_array = ['a','s','d','f','g']

# multi = [[0,1,2],[3,4,5]]

# puts multi[0][0..2]

# # my_array << 'h'
# my_array.push('h')

# puts my_array

# ..................................................................

# hash = { 'key1' => 'v1', 'key2' => 'v2', 'key3' => 'v3' }
# hash1 = { key1: '2', key2: '6', key3: '3', key4: '4' }

# # print hash{'key1'},
# # hash1.select{ |key, value| value }#......kind of loop........ error
# # hash.each_key{|k| puts "\n#{k}, 1"}#......kind of loop........
# # hash.each_value{|v| puts v}#......kind of loop........

# my_hash = Hash.new("default value")
# pets=["key1"]
# pets=["Stevie"]
# my_hash.each_value{|v| puts v, "10"}#......kind of loop........ issue

# ..................................................................

# s="Symbol"
# puts s.to_sym
# s=:symbol
# puts s.to_s
# s="Symbol"
# puts s.intern..........issue................

# ..................................................................

# a='hang,hing,hung'
# a= a.split(",")
# puts a[2]

# str = "10,20,30,Ten, Twenty and Thirty"
# puts str.split( "," , 4 )

# ..................................................................

# def greetings(hello, *names)
#     return "#{hello}, #{names}"
# end

# start = greetings("Hi", "Ali","Anas","Ahmad")

# puts start

# ..................................................................

# class Person

#     @@count = 0
#     attr_reader :name
#     attr_writer :name
#     attr_accessor :name
    
#     def Mname(parameter)

#         @classVariable = parameter 
#         puts "submitted"
#     end

#     def self.show_classVariable
        
#         return @classVariable
#     end

#     def Person.get_counts
        
#         return @@count
#     end

#     private def private_method; end

# end

# matz = Person.new()
# matz.Mname("Butt")
# puts Person.show_classVariable

# ..................................................................

# require 'date'
# a = Date.today
# puts a

# module Action
#     def jump
#         @distance = rand(4)+2
#         puts "I jumped forwar #{@distance} feet!"
#     end
# end


# class Rabbit

#     include Action
#     extend Action

#     attr_reader :name
    
#     def initialize(name)
#         @name = name
#         return @name
#     end

# end

# r = Rabbit.new("Peter")
# r.jump #include
# Rabbit.jump #exclude
# puts r.name

# ..................................................................

# def yield_name(name)

#     yield("Kim") # print "My name is Kim. "
#     yield(name) # print "My name is Eric. "

#   end
  
#   yield_name("Eric") { |n| print "My name is #{n}. \n" } # My name is Kim. My name is Eric.
#   yield_name("Peter") { |n| print "My name is #{n}. \n" } # My name is Kim. My name is Peter.

# ..................................................................

#cube = Proc.new { |x| x ** 3
# cube = Proc.new { |x| x * 3}
# a=['a','b','c'].collect!(&cube)
# # cube.call #issue
# puts a

# ..................................................................

# lambda { |param| block }
# multiply = lambda { |x| x * 6 }
# a=[1,2,3]
# y = a.collect!(&multiply)
# puts y

# ..................................................................

# if 2 < 2
#     puts "“one smaller than two”"
# elsif 2 > 2 # *careful not to mistake with else if. In ruby you write elsif*
#     puts "elsif"
# else
#     return 'false'
# end
    # or
# puts "be printed" if true
# puts 3 > 4 ? "true" : "false" # else will be putted
    
# ..................................................................

unless false # unless checks if the statement is false (opposite to if).
    puts "I'm here"
else
    puts "not here"
end
    # or
puts "not printed" unless false
puts "not printed" unless true