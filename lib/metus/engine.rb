module Metus
  class Engine < ::Rails::Engine
    isolate_namespace Metus

    initializer "metus.assets.precompile" do |app|
      app.config.assets.precompile += %w( metus/application.css )
    end

    initializer 'webpacker.proxy' do |app|
      insert_middleware = Metus.webpacker.config.dev_server.present? rescue nil
      next unless insert_middleware

      app.middleware.insert_before(
        0, Webpacker::DevServerProxy, # 'Webpacker::DevServerProxy' if Rails version < 5
        ssl_verify_none: true,
        webpacker: Metus.webpacker
      )

      app.middleware.insert_before(
        0, Rack::Static,
        urls: ['/metus-packs'], root: Metus::Engine.root.join('public').to_s
      )
    end
  end
end
