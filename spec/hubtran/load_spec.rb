require "spec_helper"

module Hubtran
  describe Load do
    before do
      Hubtran.configure do |config|
        config.token = "test"
        config.endpoint = "https://api.hubtran.dev"
        config.verify_ssl = false
      end
    end

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
        VCR.use_cassette "new_load" do
          load = described_class.new(
            {load_id: "load_id", external_id: "external_id"}
          )
          expect(load).to be_valid
          expect(load.save).to eq true
          expect(load.hubtran_id).to eq 964138
        end
      end
    end
  end
end
