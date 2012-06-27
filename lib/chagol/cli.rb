# This file handles the tasks that are to be performed when chagol is installed
# It involves creating the .chagol directory in the users home and also 
# initializing the json files that store the contents

module Chagol
  def self.install_chagol
    chagol_path = Dir.home + "/.chagol"
    Dir.mkdir(chagol_path)
    # Create the sample json files for the contacts
    File.open(chagol_path + "/contacts.json", "w") do |f|
      f.write('{"json_class":"Contact","data":{"id":1,"name":"Nikhil","phone":"9900000018"}}')
    end
    # Create the json for the lists
  end
end