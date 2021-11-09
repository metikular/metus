Metus::Engine.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join('|')}/ do
    Metus::PagesController::PAGES.each do |page|
      get "/pages/#{page}", controller: :pages, action: Metus::PagesController.path_to_actionname(page), as: page
    end

    namespace :backend do
      get :welcome, to: 'welcome#show'
      resources :admins, except: :show
    end
  end
end
