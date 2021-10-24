Metus::Engine.routes.draw do
  Metus::PagesController::PAGES.each do |page|
    get "/pages/#{page}", controller: :pages, action: Metus::PagesController.path_to_actionname(page), as: page
  end

  namespace :backend do
    get :welcome, to: 'welcome#show'
  end
end
