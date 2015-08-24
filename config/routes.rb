Rails.application.routes.draw do
  root "static_pages#home"

  resources :boards, path: "life", only: [:show] do
    collection do
      post "find"
    end
  end
end
