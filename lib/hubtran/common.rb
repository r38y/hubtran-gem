module Hubtran
  module Common
    extend ActiveSupport::Concern
    included do
      include ActiveModel::Validations
    end

    def initialize(attributes)
      @attributes = attributes
    end

    def hubtran_id
      @attributes[:hubtran_id]
    end

    def external_id
      @attributes[:external_id]
    end

    def client
      @client ||= Client.new
    end
  end
end
