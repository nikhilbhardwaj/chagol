# This file handles the tasks that are to be performed when chagol is installed
# It involves creating the .chagol directory in the users home and also 
# initializing the json files that store the contents

module Chagol
  def self.install_chagol
    chagol_path = Dir.home + "/.chagol"
    Dir.mkdir(chagol_path)
    # Create the sample json files for the contacts
    File.open(chagol_path + "/contacts.json", "w") do |f|
      f.write('{"json_class":"Chagol::Contact","data":{"id":1,"name":"Nikhil","phone":"9900000018"}}')
    end
    # Create the json for the lists
    #
    # Create the user configuration
    File.open(chagol_path + "/config.rb", "w") do |f|
      f.write('# Please change this file to replace your phone no, password and provider
# The password is your way2sms/160by2/provider password

$user = { phone_no: "",
         password: "",
         provider: "way2sms" }')
    end
  end

  # More helper methods

  # This finds the phone nos for the users whose names have been passed as
  # command line arguments also it returns phones no's that were passed
  # directly. The messages are to be sent to each no returned from here.
  def self.get_phone_nos_from_name(contacts, names)
    phone_nos = Array.new
    # Parse out phone no's first and remove them from the names first
    names.delete_if do |ph_no|
      if /[7-9][0-9]{9}/.match(ph_no)
        phone_nos << ph_no
      end
    end
    # And find the phone no's from the contacts next
    names.each do |target|
      contacts.each do |contact|
        if target.casecmp(contact.name) == 0
          # puts "#{target}, #{contact.phone}" # debug mode info
          phone_nos << contact.phone
        end
      end
    end
    return phone_nos.uniq
  end
end
