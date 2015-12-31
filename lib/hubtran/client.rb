module Hubtran
  class Client
    extend Forwardable

    def put(path, params)
      connection.put (endpoint + path), params
    end

    def post(path, params)
      connection.post (endpoint + path), params
    end

    private

    def_delegators "Hubtran.config", :endpoint, :token

    def connection
      @connection ||= Faraday.new(
        url: endpoint,
        headers: {
          'Authorization' => "Token token=#{token}",
          'Accept' => 'application/json',
        },
        ssl: {verify:  Hubtran.config.verify_ssl}
      )
    end
  end
end
