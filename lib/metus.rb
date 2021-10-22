require "metus/version"
require "metus/engine"
require "webpacker"
require "simple_form"

module Metus
  ROOT_PATH = Pathname.new(File.join(__dir__, '..'))

  class << self
    def webpacker
      @webpacker ||= ::Webpacker::Instance.new(
        root_path: ROOT_PATH,
        config_path: ROOT_PATH.join('config/webpacker.yml')
      )
    end
  end

  mattr_accessor :public_controller_class

  def self.public_controller_class
    (@@public_controller_class || 'Metus::PublicController').constantize
  end
end
