
puts "!!! Ruby CLI Notes Application !!!"
puts "" 
puts "        !!! Home Page !!!"
puts ""
puts "Please Select an Option below : "
puts "Enter '1' to Register"
puts "Enter '2' for Login"
puts "Enter '3' to exit"

n = gets.chomp.to_i
if(n==1)
  require './register.rb'
elsif(n==2)
  require './login.rb'
end