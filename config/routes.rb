Rails.application.routes.draw do
  get 'users/show'
devise_for :users
 root to: 'homes#top'
 resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  #resouces :使用するコントローラー,...で覚える
  #コントローラーにidがあるの？

    resource :favorites, only: [:create, :destroy]

    resources :post_comments, only: [:create, :destroy]
    #do-endで挟まれたものはresourcesで指定したコントローラ名に、resourceで指定したコントローラ名が続くURLが生成される。
    #このような親子関係を、「ネストする」と言う。
  end
  resources :users, only: [:show, :edit, :update]

end
