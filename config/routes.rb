Rails.application.routes.draw do
  root "static_pages#home"

  resources :boards, path: "life", only: [:show, :create] do
    collection do
      post "find"
    end
  end
end
