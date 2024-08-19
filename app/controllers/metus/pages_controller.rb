# frozen_string_literal: true

require 'asciidoctor'
require 'asciidoctor-bibtex'
require 'front_matter_parser'

module Metus
  class PagesController < Metus.public_controller_class
    def self.filename_to_pagename(directory, name)
      [directory, name].select(&:present?).join('/').to_sym
    end

    def self.parse_page(filename)
      directory = File.dirname(filename)
      directory.gsub!(/#{PAGES_DIRECTORY}[\/]?/, '')

      name, extension = basename(File.basename(filename))
      pagename = filename_to_pagename(directory, name)

      {
        name: name,
        extension: extension,
        template: template(pagename, extension),
        directory: directory,
        pagename: pagename,
        actionname: path_to_actionname(pagename),
        filename: filename
      }
    end

    def self.basename(filename)
      [
        split_extension(filename, '.html.haml'),
        split_extension(filename, '.adoc')
      ].compact.first
    end

    def self.split_extension(filename, extension)
      name = File.basename(filename, extension)

      if "#{name}#{extension}" == filename
        return [name, extension]
      end
    end

    def self.path_to_actionname(path)
      path.to_s.gsub('/', '__slash__')
    end

    def self.template(name, extension)
      case extension
      when '.html.haml'
        "pages/#{name}"
      when '.adoc'
        'metus/pages/asciidoc'
      end
    end

    PAGES_DIRECTORY = Rails.root.join('app/views/pages')

    PAGES_WITH_TEMPLATES = Dir[PAGES_DIRECTORY.join('**/*')]
      .reject { |filename| File.directory?(filename) }
      .map { |filename| Metus::PagesController.parse_page(filename) }

    PAGES = PAGES_WITH_TEMPLATES
      .map { |page| page[:pagename] }
      .map(&:to_sym)

    PAGES_WITH_TEMPLATES.each do |page|
      define_method(page[:actionname]) do
        @page = page
        render page[:template]
      end
    end
  end
end
