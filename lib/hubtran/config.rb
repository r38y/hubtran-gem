module Hubtran
  class Config
    attr_accessor :token
    attr_accessor :endpoint
    attr_accessor :verify_ssl

    def initialize
      @endpoint = "https://stagingapi.hubtran.com"
      @verify_ssl = true
    end
  end
end
