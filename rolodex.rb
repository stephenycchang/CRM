class Rolodex

  def initialize
    @contacts = []
  end

  def create_contact(first_name, last_name, email, note)
    contact = Contact.new(first_name, last_name, email, note)
    @contacts << contact
  end

  def modify_contact(id, new_first_name, new_last_name, new_email, new_note)
    @contacts.each do |contact|
      if contact.id == id
        contact.first_name = new_first_name
        contact.last_name = new_last_name
        contact.email = new_email
        contact.note = new_note
      end
    end  
  end

  def show_contacts
    @contacts.each do |contact|
      puts contact
    end
  end
end