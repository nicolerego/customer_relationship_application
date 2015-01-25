require_relative './rolodex.rb'
require_relative './contact.rb'

class CRM
	attr_reader :name
	
	def initialize(name)
		@name = name
		@rolodex = Rolodex.new
	end 

	def print_main_menu
		puts '[1] Add a contact'
		puts '[2] Modify a contact'
		puts '[3] Display all contacts'
		puts '[4] Display a contact'
		puts '[5] Display attribute'
		puts '[6] Delete a contact'
		puts '[7] Exit'
		puts 'Enter a number:'
	end 

	def main_menu
		clear_screen
		# puts "Welcome to #{@name}!"
		while true 
			puts "Welcome to #{@name}!"
			print_main_menu
			input = gets.chomp.to_i
			choose_option(input)
			return if input == 7
		end 
	end 

	def choose_option(option)
		case option
			when 1 then add_contact
			when 2 then modify_contact
			when 3 then display_contacts
			when 4 then display_single_contact
			when 5 then display_attribute
			when 6 then delete_contact
			when 7 
				clear_screen
				puts 'Goodbye!'
				return 	
			else 
				puts 'Incorrect option, try again'
		end
	end 

	def add_contact
		clear_screen
		puts "Provide Contact Details"
		
		print "First Name: "
		first_name = gets.chomp
		
		print "Last Name: "
		last_name = gets.chomp
		
		print "Email: "
		email = gets.chomp
		
		print "Note: "
		note = gets.chomp

		new_contact = Contact.new(first_name, last_name, email, note)
		@rolodex.add_contact(new_contact)
		clear_screen
	end 

	def modify_contact
		clear_screen
		puts "Provide contact ID: "
		contact_id = gets.chomp.to_i

		@rolodex.display_single_contact(contact_id)
		
		puts "Are you sure you want to modify this contact? (Yes of No)"
		modify_answer = gets.chomp.downcase

		if modify_answer == "yes"
			@rolodex.modify_contact(contact_id)
		elsif modify_answer == "no"
			print_main_menu
		else 
			puts "That is not a valid response"
		end 
		clear_screen
	end

	def display_contacts
		clear_screen
		@rolodex.display_all_contacts
	end

	def display_single_contact
		clear_screen
		puts "Enter the ID of the contact you'd like to display: "
		contact_id = gets.chomp.to_i
		@rolodex.display_single_contact(contact_id)
	end

	def display_attribute
		clear_screen
		puts "Enter the attribute you would like to display by: "
		puts "[1] First Name "
		puts "[2] Last Name "
		puts "[3] Email "
		puts "[4] Notes "
		attribute_option = gets.chomp.to_i
		@rolodex.display_attribute(attribute_option)
	end

	def delete_contact
		clear_screen
		puts "Enter the ID of the contact you'd like to delete: "
		contact_id = gets.chomp.to_i 
		@rolodex.display_single_contact(contact_id)		
		@rolodex.delete_contact(contact_id)
		puts "This contact has been deleted"
	end

	def clear_screen
  		puts "\e[H\e[2J"
  	end
end 

bitmaker = CRM.new("Bitmake Labs CRM")
bitmaker.main_menu