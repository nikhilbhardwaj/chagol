require "chagol/version"
require "chagol/cli"
require "chagol/contact"
require "net/http"

module Chagol
  class SmsSender
    def initialize(user_phone, password, provider = "way2sms")
      @sender = user_phone
      @password = password
      @provider = provider
    end

    def send(recipient,message)
      uri = URI("http://ubaid.tk/sms/sms.aspx")
      params = { uid: @sender,
                 pwd: @password,
                 phone: recipient,
                 msg: message,
                 provider: @provider
              }
      uri.query = URI.encode_www_form(params)
      response = Net::HTTP.get_response(uri)
      if response.is_a?(Net::HTTPSuccess) && response.body == "1"
        puts "Message Sent"
      else
        puts "Something Went Wrong. Error Code = #{response.body}"
      end
    end
  end
end
