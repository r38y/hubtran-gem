require "spec_helper"

module Hubtran
  describe Config do
    let(:config) { described_class.new }

    it "has an api_key" do
      expect(config.api_key).to eq nil
      config.api_key = "api-key"
      expect(config.api_key).to eq "api-key"
    end

    describe "#endpoint" do
      it "has a default" do
        expect(config.endpoint).to eq "https://stagingapi.hubtran.com"
      end

      it "allows overriding" do
        config.endpoint = "https://hubtran.dev"

        expect(config.endpoint).to eq "https://hubtran.dev"
      end
    end

    describe "#verify_ssl" do
      it "has a default" do
        expect(config.verify_ssl).to eq true
      end

      it "allows overriding" do
        config.verify_ssl = false

        expect(config.verify_ssl).to eq false
      end
    end
  end
end
