require_relative 'user'
require_relative 'notes'
puts "!!! Ruby CLI Notes Application !!!"
puts "" 
puts "        !!! Home Page !!!"
puts ""

def menu
    puts "Please Select an Option below : "
    puts "Enter '1' to Register"
    puts "Enter '2' for Login"
    puts "Enter '3' to exit"
    
    choice = (gets.chomp).to_i
    
    case choice
    when 1
      register
    when 2
      login
    when 3
      exit
    else
      puts "Please enter a valid no."
      menu
    end

end

def register
    puts "Enter your Name : "
    u_name = gets.chomp

    puts "Enter your Id : "
    u_id = gets.chomp

    puts "Enter your Email Id :"
    email = gets.chomp

    puts "Enter your City name : "
    address = gets.chomp

    puts "Enter your Password : "
    password = gets.chomp

    if User.register(u_name,u_id,email,address,password)
      puts "Registration successful!"
      login
    else
      puts "Username already exists."
      register
    end
end

def login
  puts "Enter your details to login :-"
  puts "Enter your Username : "
  u_name = gets.chomp

  puts "Enter your password : "
  password = gets.chomp

  if User.authenticate(u_name, password)
    puts "Login successful!"
    notes_menu
  else
    puts "Invalid username or Password. Please try again."
    menu
  end
end

def notes_menu
  puts ""
  puts "!!! Menu !!!"
puts "Please select an option below : "
puts "1. Create Note"
puts "2. View Notes"
puts "3. Update Note"
puts "4. Delete Note"
puts "5. Export specific note to PDF"
puts "6. Exit"

choice = (gets.chomp).to_i
case choice
when 1
  create_note
when 2
  view_note
when 3
  update_note
when 4
  delete_note
when 5
  note_pdf
when 6
  menu
else
  puts "Enter a valid choice : "
  notes_menu
end
end

def create_note
  puts ""
  puts "Enter note title:"
  title = gets.chomp
  puts "Enter note content:"
  content = gets.chomp

  Note.create(title, content)
  puts "Note created successfully!"

  notes_menu
end

def view_note
  puts ""
  notes = Note.load_notes
  if notes.empty?
    puts "No notes available."
  else
    notes.each { |note| puts "#{note.title} - #{note.timestamp} - #{note.content}"}
  end
  notes_menu
end

def update_note
  puts ""
  puts "Enter the title of the note you want to update:"
  title = gets.chomp

  notes = Note.load_notes
  note = notes.find { |n| n.title == title }

  if note
    puts "Enter new title:"
    new_title = gets.chomp
    puts "Enter new content:"
    new_content = gets.chomp

    if Note.update(title, new_title, new_content)
      puts "Note updated successfully!"
    else
      puts "Failed to update note."
    end
    notes_menu
  else
    puts "Note not found."
  end
  notes_menu
end

def delete_note
  puts ""
  puts "Enter the title of the note you want to delete:"
  title = gets.chomp
  Note.delete(title)
  puts "Note deleted!"
  notes_menu
end

def note_pdf
  puts ""
  puts "Enter the title of the note to export to PDF:"
  title = gets.chomp
  if Note.note_pdf(title)
    puts "Note exported to PDF successfully!"
  else
    puts "Note not found!"
  end
  notes_menu
end
menu

