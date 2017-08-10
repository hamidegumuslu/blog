Rails.application.routes.draw do
#site açıldığında nereye gitsin bilgisini root ile veriyoruz
#rootta gösterilen: posts controllerın index actionına git
#  root to: 'posts#index'

#  get 'posts/:id', to: 'posts#show'
#  post 'posts/:id', to: 'posts#create'
  #  get 'about', to: "pages#about"
  #  get 'index', to: "posts#index"
  # post 'create', to: "posts#create"

#post 'new', to: 'posts#create'
  root to: 'posts#index'
  resource :posts
end
