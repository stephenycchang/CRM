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
  return add_contact if first_name == ""

  puts "Please enter last name!"
  last_name = gets.chomp
  return add_contact if last_name == ""

  puts "Please enter e-mail address!"
  email = gets.chomp
  return add_contact if email == ""

  puts "Enter a note"
  note = gets.chomp
  return add_contact if note == ""

  @rolodex.create_contact(first_name, last_name, email, note)
end

def modify_contact
  puts "Which contact id would you like to change?"
  id = gets.chomp.to_i

  puts "Are you sure?"
  go_ahead = gets.chomp.downcase

  if go_ahead == "yes" || go_ahead == "yeah" || go_ahead == "y"

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
      @rolodex.modify_contact(id, new_first_name, nil, nil, nil)

    when 2
      puts "What would you like to change the last name to?"
      new_last_name = gets.chomp
      @rolodex.modify_contact(id, nil, new_last_name, nil, nil)

    when 3
      puts "What would you like to change the e-mail to?"
      new_email = gets.chomp
      @rolodex.modify_contact(id, nil, nil, new_email, nil)

    when 4
      puts "What would you like to change the notes to?"
      new_note = gets.chomp
      @rolodex.modify_contact(id, nil, nil, nil, new_note)
    end

  else main_menu

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
  puts "[1] Display first name"
  puts "[2] Display last name"
  puts "[3] Display e-mail address"
  puts "[4] Display notes"

  select_attribute = gets.chomp.to_i

  case select_attribute

  when 1
    puts "-All first names-"
    @rolodex.show_first_name
  when 2
    puts "-All last names-"
    @rolodex.show_last_name
  when 3
    puts "-All e-mail addresses-"
    @rolodex.show_email
  when 4
    puts "-All notes-"
    @rolodex.show_notes
  end

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