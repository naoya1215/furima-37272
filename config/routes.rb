Rails.application.routes.draw do
  devise_for :users #userモデルの作成をすると自動的に反映される(rails g devise user)
  root to: 'items#index'
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
end
