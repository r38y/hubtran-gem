require "spec_helper"

module Hubtran
  describe Client do
    before do
      Hubtran.configure do |config|
        config.api_key = "test"
        config.endpoint = "https://api.hubtran.dev"
      end
    end

    it "works" do
      VCR.use_cassette "client_valid_request" do
        Hubtran.configure do |config|
          config.api_key = "test"
          config.endpoint = "https://api.hubtran.dev"
          config.verify_ssl = false
        end

        response = described_class.new.put("/tms/loads/load_id", {
          load: {load_id: "load_id"}
        })
        expect(response.status).to eq 200
        json = JSON.parse(response.body)
        expect(json["load"]["id"]).to eq 964138
      end
    end

    it "returns an error if the token is wrong" do
      VCR.use_cassette "client_wrong_token" do
        Hubtran.configure do |config|
          config.api_key = "wrong"
          config.endpoint = "https://api.hubtran.dev"
          config.verify_ssl = false
        end

        response = described_class.new.put("/tms/loads/load_id", {
          load_id: "load_id"
        })
        expect(response.status).to eq 401
        json = JSON.parse(response.body)
        expect(json["error"]).to eq "Token was incorrect"
      end
    end
  end
end
