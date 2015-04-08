class Contact 

    attr_accessor :id, :first_name, :last_name, :email, :notes

    def initialize(first_name, last_name, email, notes)
        @first_name = first_name
        @last_name = last_name
        @email = email
        @notes = notes
    end

    def to_s
    	return "contact id: #{id}\n" + 
    	 "first name: #{first_name}\n" +
    	 "last name: #{last_name}\n" +
    	 "email: #{email}\n" +
    	 "notes: #{notes}"
    end
end