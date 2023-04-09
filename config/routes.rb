Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :tasks do
        resources :subtasks, only: [:create,:index,:update,:destroy]
      end
      get '/done_tasks', to: "tasks#done_tasks"
      get '/do_tasks', to: "tasks#do_tasks"
      get '/date_tasks', to: "tasks#date_tasks"
      get '/goal_tasks', to: "tasks#goal_tasks"
      get '/goal_done_tasks', to: "tasks#goal_done_tasks"
      get '/subtasks', to: "tasks#show_subtasks"
      post '/create', to: "tasks#create_subtask"
    end
  end
end