module Metus
  class Engine < ::Rails::Engine
    isolate_namespace Metus

    initializer "metus.assets.precompile" do |app|
      app.config.assets.precompile += %w( metus/application.css )
    end
  end
end
