module Hubtran
  class Load
    def initialize(attributes)
      @attributes = attributes
    end

    def save
      client.put "/tms/loads/#{load_id}", payload
    end

    private

    def payload
      {load: @attributes}
    end

    def load_id
      @attributes[:load_id]
    end

    def client
      @client ||= Client.new
    end
  end
end
