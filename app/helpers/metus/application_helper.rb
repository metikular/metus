module Metus
  module ApplicationHelper
    include ::Webpacker::Helper

    def current_webpacker_instance
      Metus.webpacker
    end
  end
end

module ApplicationHelper
  def external_link_to(title, path, options = {})
    link_to title, path, options.merge(target: '_blank', rel: 'noopener noreferrer')
  end
end
