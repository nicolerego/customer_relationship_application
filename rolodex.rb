class Rolodex
	attr_reader :contacts
	
	@@ids = 1001

	def initialize
		@contacts = []
	end

	def add_contact(contact)
		contact.id = @@ids
		@contacts << contact
		@@ids += 1
		contact
	end  

	def modify_contact(contact_id)
		modified_contact = find_contact(contact_id)
		
		puts '[1] Modify First Name' 
		puts '[2] Modify Last Name' 
		puts '[3] Modify Email'
		puts '[4] Modify Notes'
		puts 'Enter a number: '
		
		modify_number = gets.chomp.to_i

		case modify_number
			when 1
				print "New First Name: "
				new_first_name = gets.chomp
				# puts "You have changed first name to: #{new_first_name}"
				modified_contact.first_name = new_first_name
			when 2 
				print "New Last Name: "
				new_last_name = gets.chomp
				# puts "You have changed last name to: #{new_last_name}"
				modified_contact.last_name = new_last_name
			when 3
				print "New Email: "
				new_email = gets.chomp
				# puts "You have changed email to: #{new_email}"
				modified_contact.email = new_email
			when 4
				print "New Note: "
				new_note = gets.chomp
				# puts "You have changed note to: #{new_note}"
				modified_contact.note = new_note
			else 
				puts "That is not a valid response"
		end 	
	end

	def display_all_contacts
		@contacts.each { |contact| puts contact.display}
	end

	def display_single_contact(id)
		clear_screen
		single_contact = find_contact(id)
    	print single_contact.display

	end

	def display_attribute(attribute)
		clear_screen
		case attribute
		when 1 then @contacts.each { |the_contact| puts the_contact.first_name }
		when 2 then @contacts.each { |the_contact| puts the_contact.last_name }
		when 3 then @contacts.each { |the_contact| puts the_contact.email }
		when 4 then @contacts.each { |the_contact| puts the_contact.note }
		else 
			puts "That is not a valid response"
		end 	
	end

	def delete_contact(id)
		deleted_contact = find_contact(id)
    	@contacts.delete(deleted_contact)
	end

 	# Way to find contacts by their id
	def find_contact(id)
    	@contacts.find {|contact| contact.id == id}
  	end

  	def clear_screen
  		puts "\e[H\e[2J"
  	end

end 


