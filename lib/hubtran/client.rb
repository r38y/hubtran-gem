require "faraday"
module Hubtran
  class Client
    extend Forwardable

    def put(path, params)
      connection.put endpoint + path, params
    end

    private

    def_delegators "Hubtran.config", :endpoint, :api_key

    def connection
      @connection ||= Faraday.new(
        url: endpoint,
        headers: {
          'Authorization' => "Token token=#{api_key}",
          'Accept' => 'application/json',
        },
        ssl: { verify: false }
      )
    end
  end
end
