Rails.application.routes.draw do
  get 'admin/load_term_data_form_json', as: :ltdfj

  post 'admin/load_term_data_from_json_commit', as: :ltdfjc

  get 'admin/load_student_data_form_json', as: :lsdfj

  post 'admin/load_student_data_from_json_commit', as: :lsdfjc

  resources :perform_data
  resources :order_lines do
    collection do
      get :select_students_for_order
    end
  end
  resources :students
  resources :financings
  resources :faculties
  resources :groups
  resources :orders
  resources :type_scholarships
  resources :scholarship_periods
  resources :role_users
  resources :admin
  get 'welcome/index', as: :index 
  get 'welcome/insufficient_privileges', as: :ip

  resources :roles
  resources :user_sessions
  resources :users do
    member do
      get :activate
    end
  end

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
  root :to => 'welcome#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
