

class User_info
  attr_accessor :u_name , :u_id , :address , :password 
  def initialize(u_name , u_id , address ,password)
    @u_name = u_name
    @u_id = u_id
    @address = address
    @password = password
  end
end
puts "Enter your Name : "
u_name = gets.chomp

puts "Enter your Id : "
u_id = (gets.chomp).to_i

puts "Enter your City name : "
address = gets.chomp

puts "Enter your Password : "
password = gets.chomp

ob = User_info.new(u_name , u_id , address , password)

puts "Your details are :"
puts "Name     : #{ob.u_name}"
puts "Id       : #{ob.u_id}"
puts "Address  : #{ob.address}"
puts "Password : #{ob.password}"

puts "!!! Registered Successfully !!!"


