Rails.application.routes.draw do
  devise_for :users
  root to: 'hotelapps#top'
  get 'hotelapps/top', to: 'hotelapps#top', as: 'top_hotelapp'
  get 'users/show'
  #get 'rents/new/:id', to: 'rents#new', as: :rents_new #アクションでホテルのidを取得
  resources :users, only: [:show] 
  resources :hotelapps do
    resources :rents, only: [:new]
  end
  resources :rents, except: [:new] do
    #post :confirm, action: :confirm, on: :new
  end
  #resources :hotelapps だとhotelapps/topへのルーティングができなかった。なぜ？
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
