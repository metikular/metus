Metus::Engine.routes.draw do
  Metus::PagesController::PAGES.each do |page|
    get "/pages/#{page}", controller: :pages, action: page
  end
end
