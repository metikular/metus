module Metus
  class Engine < ::Rails::Engine
    isolate_namespace Metus

    config.to_prepare do
      # Make the implementing application's helpers available to the engine.
      # This is required for the overriding of engine views and helpers to work correctly.
      Metus::ApplicationController.helper Rails.application.helpers
    end

    initializer "metus.assets.precompile" do |app|
      app.config.assets.precompile += %w( metus/application.css )
    end

    config.app_middleware.use(
      Rack::Static,
      urls: ["/metus-packs"], root: Metus::Engine.root.join('public')
    )

    initializer 'webpacker.proxy' do |app|
      insert_middleware = Metus.webpacker.config.dev_server.present? rescue nil
      next unless insert_middleware

      app.middleware.insert_before(
        0, Webpacker::DevServerProxy, # 'Webpacker::DevServerProxy' if Rails version < 5
        ssl_verify_none: true,
        webpacker: Metus.webpacker
      )
    end
  end
end
