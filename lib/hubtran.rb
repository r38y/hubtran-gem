require "hubtran/version"
require "hubtran/configuration"

module Hubtran
  class << self
    attr_writer :configuration
  end

  def self.config
    @config ||= Configuration.new
  end

  def self.configure
    yield(config)
  end

  def self.reset
    @config = Configuration.new
  end
end
