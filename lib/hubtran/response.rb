module Hubtran
  class Response
    def initialize(response)
      @response = response
    end

    def successful?
      @response.success?
    end

    def errors
      return [] if successful?
      to_hash["errors"]
    end

    def to_hash
      @to_hash ||= JSON.parse(@response.body)
    end
  end
end
