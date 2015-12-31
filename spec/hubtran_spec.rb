require 'spec_helper'

describe Hubtran do
  describe "#configure" do
    before do
      Hubtran.configure do |config|
        config.token = "token"
        config.endpoint = "https://hubtran.dev"
      end
    end

    it "sets token" do
      expect(Hubtran.config.token).to eq "token"
    end

    it "sets endpoint" do
      expect(Hubtran.config.endpoint).to eq "https://hubtran.dev"
    end
  end
end
