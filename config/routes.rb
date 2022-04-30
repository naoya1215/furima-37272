Rails.application.routes.draw do
  devise_for :users #userモデルの作成をすると自動的に反映される(rails g devise user)
  root to: 'items#index'
  # 7つのアクションを使用しているので省略をする(, only: [:index, :new, :create, :show, :edit, :update, :destroy])
  resources :items do
    resources :orders, only: [:index, :create]
  end
end
