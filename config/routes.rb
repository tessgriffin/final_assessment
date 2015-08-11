Rails.application.routes.draw do
  root to: "lists#index"
  resources :lists do 
    resources :tasks, except: :destroy
  end
end
