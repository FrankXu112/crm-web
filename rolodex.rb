class Rolodex

    def initialize
        @last_id = 1
        @contacts = []
    end

    def add_contact(contact)
        contact.id = @last_id
        @contacts << contact
        @last_id += 1
    end
end