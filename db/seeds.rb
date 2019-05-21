
  # contact = Contact.create({first_name: "Michael", last_name: "Douglas", phone_number: "773-8374683837", email: "michael@gmail.com"})
   #contact = Contact.create({first_name: "Sarah", last_name: "Jessica Parker", phone_number: "773-37643687", email: "sarah@gmail.com"})
   contact = Contact.find_by({first_name: nil})
   contact.destroy


