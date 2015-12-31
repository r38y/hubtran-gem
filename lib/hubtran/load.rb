module Hubtran
  class Load
    include Common

    validates_presence_of :load_id, :external_id

    # TODO move to common
    def save
      return false unless valid?
      client.put("/tms/loads/#{load_id}", payload).tap do |response|
        r = Response.new(response)
        if r.successful?
          @attributes[:hubtran_id] = r.to_hash["load"]["id"]
        end
      end
      true
    end

    private

    def payload
      {load: @attributes}
    end

    def load_id
      @attributes[:load_id]
    end
  end
end
