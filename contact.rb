class Contact 

    attr_accessor :id, :first_name, :last_name, :email, :notes

    def initialize(first_name, last_name, email, notes)
        @first_name = first_name
        @last_name = last_name
        @email = email
        @notes = notes
    end

    def to_s
    	puts "contact id: #{id}"
    	puts "first name: #{first_name}"
    	puts "last name: #{last_name}"
    	puts "email: #{email}"
    	puts "notes: #{notes}"
    end
end