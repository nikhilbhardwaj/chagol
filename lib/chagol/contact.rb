require "json"

module Chagol
  class Contact
    attr_reader :id, :name, :phone
    def initialize(id, name, phone)
      @id = id
      @name = name
      @phone = phone
    end

    def to_json(*a)
      {
        json_class: "Chagol::" + self.class.name,
        data: { id: @id, name: @name, phone: @phone }
      }.to_json(*a)
    end

    def self.json_create(o)
      new( o["data"]["id"], o["data"]["name"], o["data"]["phone"] )
    end
  end
end
