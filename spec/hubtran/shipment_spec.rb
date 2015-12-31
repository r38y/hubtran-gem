require "spec_helper"

module Hubtran
  describe Shipment do
    context "validations" do
      it "validates presence of external_id" do
        shipment = described_class.new({})
        expect(shipment).to_not be_valid
        expect(shipment.errors.full_messages).to eq ["External can't be blank"]
      end
    end

    describe "#save" do
      it "does not save the shipment if invalid" do
        shipment = described_class.new({})
        expect(shipment.save).to eq false
        expect(shipment.errors.full_messages.to_sentence).
          to match(/External can't be blank/)
      end

      it "saves the shipment if valid" do
        VCR.use_cassette "new_shipment" do
          shipment = described_class.new(
            {external_id: "external_id"}
          )
          expect(shipment).to be_valid
          expect(shipment.save).to eq true
          expect(shipment.hubtran_id).to eq 574581
        end
      end
    end
  end
end
