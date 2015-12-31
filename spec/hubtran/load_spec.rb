require "spec_helper"

module Hubtran
  describe Load do
    describe "#save" do
      it "does not save the load if invalid" do
        load = described_class.new({})
        expect(load.save).to eq false
        expect(load.errors.full_messages.to_sentence).
          to match(/Load can't be blank/)
        expect(load.errors.full_messages.to_sentence).
          to match(/External can't be blank/)
      end

      it "saves the load if valid" do
        load = described_class.new(
          {load_id: "load_id", external_id: "external_id"}
        )
        allow(load).to receive(:client).and_return(double("client", put: true))
        expect(load).to be_valid
        expect(load.save).to eq true
      end
    end
  end
end
