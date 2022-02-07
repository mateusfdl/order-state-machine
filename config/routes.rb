Rails.application.routes.draw do
  resources :orders do
    get 'start_progress', to: 'orders#start_progress'
    get 'complete', to: 'orders#complete'
  end
end
