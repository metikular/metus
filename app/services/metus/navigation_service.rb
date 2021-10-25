module Metus
  class NavigationService
    attr_reader :link_options

    def initialize(path, strategy, main_app, request, params, options)
      @main_app = main_app

      parsed_path = parse_path(path)

      options[:class] = '' if options[:class].blank?

      case strategy
      when :controller
        options[:class] += ' active' if parsed_path[:controller] == params[:controller]
      when :exact
        current_path = parse_path(request.original_url)

        options[:class] += ' active' if parsed_path == current_path
      end

      @link_options = options
    end

    private

    def parse_path(path)
      @main_app.routes.recognize_path(path)
    rescue
      engine_mount_path = Metus::Engine.routes.find_script_name({})

      begin
        Metus::Engine.routes.recognize_path(path.gsub(/^#{engine_mount_path}/, ''))
      rescue
        nil
      end
      nil
    end
  end
end
