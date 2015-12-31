require "hubtran/version"
require "hubtran/config"
require "hubtran/client"
require "hubtran/load"

module Hubtran
  class << self
    attr_writer :config
  end

  def self.config
    @config ||= Config.new
  end

  def self.configure
    yield(config)
  end

  def self.reset
    @config = Config.new
  end
end
