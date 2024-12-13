puts "!!! Menu !!!"
puts "Please select an option below : "
puts "1. Create Note"
puts "2. View Notes"
puts "3. Update Note"
puts "4. Delete Note"
puts "5. Export specific note to PDF"
puts "6. Exit"

n = (gets.chomp).to_i
if n==1
  require './create_note.rb'
elsif n == 2
  require './view_notes.rb'
elsif n==3
  require './update_note.rb'
elsif n==4
  require './delete_note.rb'
elsif n==5
  require './note_pdf.rb'
end
