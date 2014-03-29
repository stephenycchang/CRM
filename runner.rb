require "./rolodex"
require "./contact"

class Runner

  def initialize
    @rolodex = Rolodex.new
  end

  def print_main_menu
    puts "[1] Add a new contact"
    puts "[2] Modify an existing contact"
    puts "[3] Delete a contact"
    puts "[4] Display all the contacts"
    puts "[5] Display an attribute"
    puts "[6] Exit"
    puts "Please Enter a number"
  end

#Check if there is an input#

def add_contact
  puts "Please enter first name!"
  first_name = gets.chomp
  puts "Please enter last name!"
  last_name = gets.chomp
  puts "Please enter e-mail address!"
  email = gets.chomp
  puts "Enter a note"
  note = gets.chomp
  @rolodex.create_contact(first_name, last_name, email, note)
end

def modify_contact
  puts "Which contact id would you like to change?"
  id = gets.chomp.to_i

  # puts "Are you sure?"
  # go_ahead = gets.chomp.downcase
  puts "Please select which item to change."
  puts "[1] Change the first name."
  puts "[2] Change the last name."
  puts "[3] Change the e-mail address"
  puts "[4] Change the note on their file"

  change_me_now = gets.chomp.to_i

  case change_me_now

  when 1
    puts "What would you like to change the first name to?"
    new_first_name = gets.chomp
    @rolodex.modify_contact(id, new_first_name, new_last_name, new_email, new_note)

  when 2
    puts "What would you like to change the last name to?"
    new_last_name = gets.chomp
    @rolodex.modify_contact(id, new_first_name, new_last_name, new_email, new_note)

  when 3
    puts "What would you like to change the e-mail to?"
    new_email = gets.chomp
    @rolodex.modify_contact(id, new_first_name, new_last_name, new_email, new_note)

  when 4
    puts "What would you like to change the notes to?"
    new_note = gets.chomp
    @rolodex.modify_contact(id, new_first_name, new_last_name, new_email, new_note)
  end
end



def delete_contact
  puts "Which contact would you like to delete? (Please enter ID)"
  id = gets.chomp.to_i
  @rolodex.delete_contact(id)

end

def display_contact
  puts "All contacts"
  @rolodex.show_contacts
  puts "----------"
end

def display_attribute
  puts "Which attribute?"
end

def main_menu
  done = false
  while !done
    print_main_menu 
    input = gets.chomp.to_i
    if input == 1
      add_contact
    elsif input == 2
      modify_contact
    elsif input == 3
      delete_contact
    elsif input == 4
      display_contact
    elsif input == 5
      display_attribute
    elsif input == 6
      done = true
    end
  end
end
end

runner = Runner.new
runner.main_menu