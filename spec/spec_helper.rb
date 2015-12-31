$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "hubtran"
require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
end

Hubtran.configure do |config|
  config.token = "test"
  config.endpoint = "https://api.hubtran.dev"
  config.verify_ssl = false
end
