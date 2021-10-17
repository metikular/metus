module Metus
  module ApplicationHelper
    include ::Webpacker::Helper

    def current_webpacker_instance
      Metus.webpacker
    end
  end
end
