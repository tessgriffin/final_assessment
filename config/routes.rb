Rails.application.routes.draw do
  root to: "lists#index"
  resources :lists do 
    resources :tasks, except: :destroy
  end

  put "/task/:id/update", to: "tasks#toggle_status"
  put "/task/:id/delete_image", to: "tasks#delete_image"
end
