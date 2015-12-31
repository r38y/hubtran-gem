require "spec_helper"

module Hubtran
  describe Response do
    describe "#successful?" do
      it "is true if the request was successful" do
        response = described_class.new(double("response", success?: true))
        expect(response).to be_successful
      end

      it "is false if the request failed" do
        response = described_class.new(double("response", success?: false))
        expect(response).to_not be_successful
      end
    end

    describe "#errors" do
      it "returns an empty array if successful" do
        response = described_class.new(
          double("response", success?: true)
        )
        expect(response.errors).to eq []
      end

      it "returns an array of errors from the API" do
        response = described_class.new(
          double("response", success?: false, body:
                 {"errors": ["Load is required"]}.to_json)
        )
        expect(response.errors).to eq ["Load is required"]
      end
    end
  end
end
