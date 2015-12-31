module Hubtran
  class Load
    include ActiveModel::Validations

    validates_presence_of :load_id, :external_id

    def initialize(attributes)
      @attributes = attributes
    end

    def save
      return false unless valid?
      response = client.put "/tms/loads/#{load_id}", payload
      update_from_response(response)
      true
    end

    def update_from_response(response)
      @attributes[:hubtran_id] = JSON.parse(response.body)["load"]["id"]
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
