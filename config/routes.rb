Rails.application.routes.draw do
  resources :tenders
  devise_for :users
  devise_for :admins
  namespace :admin do
    get 'dashboards/show'
  end
  get 'static_pages/index'
  root :to => 'static_pages#index'
end
