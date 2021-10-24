# frozen_string_literal: true

module Metus
  class PagesController < PublicController
    def self.filename_to_pagename(filename)
      directory = File.dirname(filename)
      directory.gsub!(/#{PAGES_DIRECTORY}[\/]?/, '')

      name = File.basename(filename, '.html.haml')

      [directory, name].select(&:present?).join('/').to_sym
    end

    def self.path_to_actionname(path)
      path.to_s.gsub('/', '__slash__')
    end

    PAGES_DIRECTORY = Rails.root.join('app/views/pages')

    PAGES = Dir[PAGES_DIRECTORY.join('**/*')]
      .reject { |filename| File.directory?(filename) }
      .map { |filename| Metus::PagesController.filename_to_pagename(filename) }
      .map(&:to_sym)

    PAGES.each do |page|
      define_method(Metus::PagesController.path_to_actionname(page)) do
        render "pages/#{page}.html.haml"
      end
    end
  end
end
