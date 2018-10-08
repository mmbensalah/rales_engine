Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/most_revenue'           => 'most_revenue#index'
        get '/most_items'             => 'most_items#index'
        get '/revenue'                => 'revenue#index'
        get '/:id/revenue'            => 'revenue#show'
        get '/:id/favorite_customer'  => 'revenue#show'
        get '/find'                   => 'find#show'
        get '/find_all'               => 'find#index'
        get '/:id/items'              => 'items#index'
        get '/:id/invoices'           => 'invoices#index'
      end
      namespace :customers do
        get '/find'                   => 'find#show'
        get '/find_all'               => 'find#index'
        get '/:id/invoices'           => 'invoices#index'
        get '/:id/transactions'       => 'transactions#index'
        get '/:id/favorite_merchant'  => 'favorite_merchant#show'
      end
      namespace :items do
        get '/find'                   => 'find#show'
        get '/find_all'               => 'find#index'
        get '/:id/invoice_items'      => 'invoice_items#index'
        get '/:id/merchant'           => 'merchant#show'
      end
      namespace :invoices do
        get '/find'                   => 'find#show'
        get '/find_all'               => 'find#index'
        get '/:id/transactions'       => 'transactions#show'
        get '/:id/items'              => 'items#index'
        get '/:id/invoice_items'      => 'invoice_items#show'
        get '/:id/customer'           => 'customer#show'
        get '/:id/merchant'           => 'merchant#show'
      end
      namespace :invoice_items do
        get '/find'                   => 'find#show'
        get '/find_all'               => 'find#index'
        get '/:id/item'               => 'items#show'
        get '/:id/invoice'            => 'invoices#show'
      end
      namespace :transactions do
        get '/find'                   => 'find#show'
        get '/find_all'               => 'find#index'
        get '/:id/invoice'            => 'invoice#show'
      end
      resources :merchants,    only: [:index, :show]
      resources :customers,    only: [:index, :show] do
        get '/favorite_merchant' => 'customers/favorite_merchant#show'
      end
      resources :items,        only: [:index, :show]
      resources :invoices,     only: [:index, :show]
      resources :invoice_items,only: [:index, :show]

      resources :transactions, only: [:index, :show]
    end
  end
end
