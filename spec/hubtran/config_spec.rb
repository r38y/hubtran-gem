require "spec_helper"

module Hubtran
  describe Config do
    let(:config) { described_class.new }

    it "has an api_key" do
      expect(config.api_key).to eq nil
      config.api_key = "api-key"
      expect(config.api_key).to eq "api-key"
    end
  end
end
