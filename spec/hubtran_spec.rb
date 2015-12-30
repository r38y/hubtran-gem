require 'spec_helper'

describe Hubtran do
  describe "#configure" do
    before do
      Hubtran.configure do |config|
        config.api_key = "api-key"
        config.endpoint = "https://hubtran.dev"
      end
    end

    it "sets api_key" do
      expect(Hubtran.config.api_key).to eq "api-key"
    end

    it "sets endpoint" do
      expect(Hubtran.config.endpoint).to eq "https://hubtran.dev"
    end
  end
end
