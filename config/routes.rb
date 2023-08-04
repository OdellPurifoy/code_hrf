Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users

  resources :lounges

  get 'my_lounge', to: 'lounges#my_lounge'
end
