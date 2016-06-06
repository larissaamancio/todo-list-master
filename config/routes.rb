Rails.application.routes.draw do
  root to: "todos#public"

  devise_for :users

  resources :todos do
    post "items", to: "items#create"
    put "is_done/:todo_id", to: "todos#is_done", as: :todo_is_done
  end

  delete "items/:id", to: "items#destroy", as: :item

end

