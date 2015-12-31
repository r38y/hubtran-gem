require "spec_helper"

module Hubtran
  describe Client do
    before do
      Hubtran.configure do |config|
        config.api_key = "test"
        config.endpoint = "https://api.hubtran.test"
      end
    end

    it "does not asplode" do
      described_class.new
    end
  end
end
