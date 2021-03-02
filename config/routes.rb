Rails.application.routes.draw do
  devise_for :users
  root "events#index"

  resources :events do
    resources :comments, only: [:create, :destroy]
    resources :subscriptions, only: [:create, :destroy]
    resources :photos, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]

  mount LetterOpenerWeb::Engine, at: "/mails" if Rails.env.development?
end
