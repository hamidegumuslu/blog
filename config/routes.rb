Rails.application.routes.draw do
  devise_for :users


  devise_scope :user do
    root to: 'devise/sessions#new'
  end
    resources :categories
  resources :posts do
    resources :comments
  end
end
