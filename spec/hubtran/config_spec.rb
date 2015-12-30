require "spec_helper"

module Hubtran
  describe Config do
    let(:config) { described_class.new }

    it "has an api_key" do
      expect(config.api_key).to eq nil
      config.api_key = "api-key"
      expect(config.api_key).to eq "api-key"
    end

    it "has a default endpoint" do
      expect(config.endpoint).to eq "https://stagingapi.hubtran.com"
    end

    it "allows setting the endpoint" do
      config.endpoint = "https://hubtran.dev"

      expect(config.endpoint).to eq "https://hubtran.dev"
    end
  end
end
