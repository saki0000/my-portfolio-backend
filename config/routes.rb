Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :tasks do
        resources :subtasks, only: [:create,:index]
      end
      get '/done_tasks', to: "tasks#done_tasks"
      get '/do_tasks', to: "tasks#do_tasks"
    end
  end
end