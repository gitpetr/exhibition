Rails.application.routes.draw do
  get 'kso/index'
  resource :profiles
  get 'cabinet', to: 'users_cabinet#index', as: :cabinet
  resources :questionnaires
  resources :tenders
  devise_for :users
  devise_for :admins
  namespace :admin do
    get '', to: 'dashboards#show', as: :admin
    resources :tenders
  end

  root 'front#index'
end
