# Chagol

This was a project that I worked on whilst in college.
The api it uses has been withdrawn by the author and it doesn't work anymore.
I don't really use way2sms these days and don't actively work on maintaining this.
This only exists so that one day I can look back at how I wrote code in college
and because I don't have the heart to delete this. It served me well when I needed it.

Chagol is a ruby gem that you can use to send text messages to any
mobile phone in India using a service provider like way2sms or 160by2.
It can be used from the command line as well as from other ruby scripts
and applications.

## Installation

    $ gem install chagol

## Usage

### Command Line Usage
    $ chagol -v
This will tell you to configure it before you can use it. Only the
~/.chagol/config.rb is mandatory. Open this in any text editor of your
choice and Enter your phone no and password from way2sms/160by2 etc. It
is recommended that you add some contacts too, this will make using
chagol more intuitive. They must be in the format specified, please keep
the id's unique.

Once it is configured you should be able to see what version you are
running with :

    $ chagol -v

This is how you will actually be using chagol from the command line.

    $ chagol --to Nikhil --message "Hello There"

alternatively you can use the shorthand

    $ chagol -t Nikhil -m "Your Message"

The message needs to be quoted. To send a message to multiple people you
can use

    $ chagol -t Nikhil,Abc,Xyz -m "Your message"

If you don't wish to set up your contacts then you will have to use the
10 digit mobile no. Please don't prefix it with 0 or +91

    $ chagol -t 9876543210 -m "Your message"

You can use a combination of names and numbers together like

    $ chagol -t Nikhil,9876543210,Abc -m "Your message"

For the exhaustive list of options run

    $ chagol -h

Right now list's haven't been implemented. Feel free to implement them
or ask me if you don't write ruby :)

### Usage in another ruby project or a rails app
    require 'chagol'
    texter = Chagol::SmsSender.new("9876543210","password","way2sms")
    texter.send("9968154700", "Chagol Rocks")
Make appropriate changes to your phone no, password and provider.
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
6. Or suggest features and improvements
