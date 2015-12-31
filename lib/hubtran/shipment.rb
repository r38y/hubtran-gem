module Hubtran
  class Shipment
    include Common

    validates_presence_of :external_id

    # TODO move to common
    def save
      return false unless valid?
      client.post("/tms/shipments", payload).tap do |response|
        r = Response.new(response)
        if r.successful?
          @attributes[:hubtran_id] = r.to_hash["shipments"][0]["id"]
        end
      end
      true
    end

    private

    def payload
      {shipments: [@attributes]}
    end
  end
end
