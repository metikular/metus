# frozen_string_literal: true

module Metus
  class PagesController < PublicController
    PAGES = Dir[Rails.root.join('app/views/pages/*')].map { |filename| File.basename(filename, '.html.haml') }.map(&:to_sym)

    PAGES.each do |page|
      define_method(page) {}
    end
  end
end
