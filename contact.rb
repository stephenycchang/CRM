class Contact

  @@counter = 1000

  attr_accessor :first_name, :last_name, :email, :note, :id

  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @@counter += 1
    @id = @@counter
  end

  def to_s
    " User ID: #{id}\n First Name: #{first_name}\n Last Name: #{last_name}\n E-mail: #{email}\n Notes: #{note}"
  end
end