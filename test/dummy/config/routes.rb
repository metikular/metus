Rails.application.routes.draw do
  devise_for :admins
  mount Metus::Engine => "/metus"

  root to: 'metus/pages#home'

  get :admin_root, to: redirect('/metus/backend/welcome'), status: 302, as: :admin_root
end
