Rails.application.routes.draw do
  match "last_wearable/update", to: "last_wearable#update", via: [:option, :put]
  resources :activities
  resources :wearable_labels
  resources :gyroscopes
  resources :accelerometers
  resources :devices
  resources :last_wearable
  resources :prediction
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
