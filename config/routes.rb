Rails.application.routes.draw do
  root "static_pages#home"

  resources :boards, only: [:show]
end
