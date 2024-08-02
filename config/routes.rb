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
  get '/about' => 'public/homes#about'

  get '/users/my_page' => 'public/users#show', as: 'mypage'
  get '/users/information/edit' => 'public/users#edit', as: 'edit_user'
  patch '/users/information' => 'public/users#update', as: 'user'
  get '/users/unsubscribe' => 'public/users#unsubscribe', as: 'unsubscribe'
  patch '/users/withdraw' => 'public/users#withdraw', as: 'withdraw'
  get '/users/favorites' => 'public/users#favorites', as: 'favorites'

  delete '/cart_items/destroy_all' => 'public/cart_items#destroy_all', as: 'destroy_all'

  post '/orders/confirm' => 'public/orders#confirm', as: 'orders_confirm'
  get '/orders/thanks' => 'public/orders#thanks', as: 'thanks'

  get '/users' => redirect("/users/sign_up")
  get '/users/information' => redirect("/users/information/edit")

  scope module: :public do
    resources :items, only:[:index, :show] do
      resource :favorite, only:[:create, :destroy]
      resources :reviews, only:[:new, :create, :index]
        post '/reviews/confirm' => 'reviews#confirm', as: 'reviews_confirm'
    end
    resources :cart_items, only:[:index, :create, :destroy, :update]
    resources :orders, only:[:new, :create, :index, :show]
    resources :addresses, only:[:index, :create, :edit, :update, :destroy]
    resources :notices, only:[:index, :show]
    resources :tags, only:[:index]
  end
# 管理者用
  namespace :admin do
    root to: 'homes#top'

    resources :items, only:[:new, :create, :index, :show, :edit, :update] do
      resources :reviews, only:[:index, :destroy]
    end
    resources :users, only:[:index, :show, :edit, :update]
    resources :tags, only:[:index, :create, :edit, :update]
    resources :notices, only:[:new, :create, :index, :show, :edit, :update, :destroy]
    resources :notice_genres, only:[:index, :create, :edit, :update]
    resources :orders, only:[:show, :update]
    resources :order_details, only:[:update]
  end



end
