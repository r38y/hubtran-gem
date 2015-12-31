require "spec_helper"

module Hubtran
  describe Load do
    it "does not asplode" do
      described_class.new({load_id: "test"})
    end
  end
end
