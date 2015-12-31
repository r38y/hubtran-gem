module Hubtran
  class Load
    include ActiveModel::Validations

    validates_presence_of :load_id, :external_id

    def initialize(attributes)
      @attributes = attributes
    end

    def save
      return false unless valid?
      client.put("/tms/loads/#{load_id}", payload).tap do |response|
        json = JSON.parse(response.body)
        @attributes[:hubtran_id] = json["load"]["id"]
      end
      true
    end

    def hubtran_id
      @attributes[:hubtran_id]
    end

    private

    def payload
      {load: @attributes}
    end

    def load_id
      @attributes[:load_id]
    end

    def external_id
      @attributes[:external_id]
    end

    def client
      @client ||= Client.new
    end
  end
end
