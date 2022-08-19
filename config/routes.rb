Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :tasks
      get '/done_tasks', to: "tasks#done_tasks"
    end
  end
end