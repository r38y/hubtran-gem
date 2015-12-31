require "spec_helper"

module Hubtran
  describe Client do
    it "works" do
      VCR.use_cassette "client_valid_request" do
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
          config.token = "wrong"
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
