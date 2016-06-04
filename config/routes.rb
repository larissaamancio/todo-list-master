Rails.application.routes.draw do
  root to: "todos#public"

  devise_for :users

  resources :todos do
    post "items", to: "items#create"
  end

  delete "items/:id", to: "items#destroy", as: :item

end

