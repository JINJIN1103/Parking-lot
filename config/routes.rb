Rails.application.routes.draw do
  root :to => 'public/homes#top'
  post '/create_task_m', to: 'public/tasks#create_m', as: 'board_list_tasks_m'
  
  scope module: :public do
    resources :boards do
      resources :lists do
        resources :tasks
      end
    end
  end
  
  devise_for :admins, controllers: {
    sessions:      'admin/admins/sessions',
    passwords:     'admin/admins/passwords',
  }
  devise_for :customers, controllers: {
    sessions:      'public/customers/sessions',
    passwords:     'public/customers/passwords',
    registrations: 'public/customers/registrations'
  }
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
