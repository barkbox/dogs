Rails.application.routes.draw do
  resources :dogs, except: [:new, :edit]
end
