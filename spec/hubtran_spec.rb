require 'spec_helper'

describe Hubtran do
  describe "#configure" do
    before do
      Hubtran.configure do |config|
        config.api_key = "api-key"
      end
    end

    it "sets api_key" do
      expect(Hubtran.config.api_key).to eq "api-key"
    end
  end
end
