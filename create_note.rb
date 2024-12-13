puts "Enter Note tittle : "
tittle = gets.chomp
tittle = tittle + ".txt"

file = File.new(tittle , 'w+')
puts "Enter Note content : "
note = gets
file.syswrite(note)
file.close

puts "Note Created Successfully!"

=begin
file1 = File.open(tittle,'r+')
puts "Here is your note :"
puts file1.read()
file1.close
=end

