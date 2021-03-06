Rails.application.routes.draw do


  namespace :api do
    namespace :v1 do
      namespace :items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find_all#index'
        get '/random', to: 'random#show'
        get '/most_revenue', to: 'most_revenue#index'
        get "/:id/best_day", to: "best#show"
        get "/:id/merchant", to: "merchant#show"
        get "/:id/invoice_items", to: "invoice_items#show"
        get "/most_items", to: "most_items#index"
        get '/most_revenue', to: 'most_revenue#show'
      end

      namespace :invoices do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find_all#index'
        get '/random', to: 'random#show'
        get "/:id/transactions", to: "invoices_trans#show"
        get "/:id/invoice_items", to: "invoice_items#show"
        get "/:id/items", to: "items#show"
        get "/:id/customer", to: "customer#show"
        get "/:id/merchant", to: "merchant#show"
      end

      namespace :invoice_items do
        get '/find', to: 'find#show'
        get '/find_all', to: 'find_all#index'
        get '/random', to: 'random#show'
        get '/:id/invoice', to: 'invoice#show'
        get '/:id/item', to: 'item#show'
      end

      namespace :customers do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
        get "/:id/favorite_merchant", to: "favorites#show"
        get "/:id/invoices", to: "invoices#index"
        get "/:id/transactions", to: "transactions#index"
      end

      namespace :merchants do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
        get "/revenue", to: "revenue#index"
        get "/:id/favorite_customer", to: "favorite_customer#show"
        get "/:id/revenue", to: "revenue#show"
        get "/most_items", to: "most_items#index"
        get "/:id/items", to: "items#index"
        get "/:id/invoices", to: "invoices#index"
      end

      namespace :transactions do
        get "/find", to: "find#show"
        get "/find_all", to: "find#index"
        get "/random", to: "random#show"
        get "/:id/invoice", to: "invoice#show"
      end

      resources :items, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :merchants, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :customers, only: [:index, :show]
    end
  end
end
