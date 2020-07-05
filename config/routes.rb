Rails.application.routes.draw do
  root 'dashboard#show'

  namespace :api, constraints: { format: :json }, defaults: { format: :json } do
    resources :transactions, only: [] do
      collection do
        get :summary
        get :monthly_revenue
      end
    end
  end
end
