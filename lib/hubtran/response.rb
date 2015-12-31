module Hubtran
  class Response
    def initialize(response)
      @response = response
    end

    def successful?
      @response.success?
    end

    def errors
      [].tap do |errors|
        unless successful?
          to_hash["errors"]
        end
      end
    end

    def to_hash
      @to_hash ||= JSON.parse(@response.body)
    end
  end
end
