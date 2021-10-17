Rails.application.routes.draw do
  devise_for :admins
  mount Metus::Engine => "/metus"

  root to: 'metus/pages#home'
end
