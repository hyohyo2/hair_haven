Rails.application.routes.draw do


# 顧客用
# URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

# 管理者用
# URL /admin/sign_in ...
  devise_for :admin,skip:[:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

# 顧客用
  root to: 'public/homes#top'
  get '/about' => 'public/homes#about', as: 'about'
  



  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'notice_genres/index'
    get 'notice_genres/edit'
  end
  namespace :admin do
    get 'notices/new'
    get 'notices/index'
    get 'notices/show'
    get 'notices/edit'
  end
  namespace :admin do
    get 'tags/index'
    get 'tags/edit'
  end
  namespace :admin do
    get 'reviews/index'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'items/new'
    get 'items/index'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'tags/index'
  end
  namespace :public do
    get 'reviews/new'
    get 'reviews/index'
  end
  namespace :public do
    get 'notices/index'
    get 'notices/show'
  end
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/thanks'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/unsubscribe'
    get 'users/favorites'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
end
