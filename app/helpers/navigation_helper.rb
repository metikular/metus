module NavigationHelper
  def nav_link_to(title, path, strategy, options = {})
    service = Metus::NavigationService.new(path, strategy, main_app, request, params, options)

    link_to title, path, service.link_options
  end
end
