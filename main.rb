# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './candidates'
require './filters'

while true do
    puts "Welcome to the super rad candidate program!"
    puts "1. 'find 1' Find a specific candidate by their ID number"
    puts "2. 'all' Print all candidates"
    puts "3. 'qualified' Print only those candidates that are qualifed"
    puts "4. 'quit' Exit the program"
    print "Enter your selection: "
    selection = gets.chomp

    case selection
    when "find 1"
      print "Enter the candidate's ID: "
      pp find(gets.chomp.to_i)
    when "all"
      pp @candidates
    when "qualified"
      pp qualified_candidates @candidates
    when "quit"
      exit
    end
  end
