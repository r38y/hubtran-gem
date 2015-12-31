$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "hubtran"
require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "fixtures/vcr_cassettes"
  config.hook_into :webmock
end
