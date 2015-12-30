module Hubtran
  class Config
    attr_accessor :api_key
    attr_accessor :endpoint

    def initialize
      @endpoint = "https://stagingapi.hubtran.com"
    end
  end
end
