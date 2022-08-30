module Api
    module V1
        class TasksController < ApplicationController
            before_action :set_task, only: [:show, :update, :destroy]
            before_action :set_user_tasks,only:[:index,:done_tasks,:user_tasks,:do_tasks]
            def index
                tasks=@tasks.where(statement: false,)
                render json: tasks, include:[:subtasks],status: 200
            end

            def show
                render json: @task, include:[:subtasks],status:200
            end

            def create
                @task = Task.new(task_params)
                if @task.save
                render json: @task
                else
                render json: @task.errors, status: :unprocessable_entity
                end
            end

            def update
                if @task.update(task_params)
                render json: @task
                else
                render json: @task.errors, status: :unprocessable_entity
                end
            end

            def destroy
                @task.destroy
            end

            def done_tasks
                tasks=@tasks.where(statement: true)
                render json: tasks, include:[:subtasks],status: 200
            end

            def do_tasks
                tasks=@tasks.where(statement:false).where(box: params[:box])
                render json: tasks, include:[:subtasks],status: 200
            end
            private
            def set_task
                @task = Task.find(params[:id])
            end

            def set_user_tasks
                @tasks=Task.where(user_id: params[:id])
            end

            def task_params
                params.require(:task).permit(:user_id,:name,:box,:date,:due_date,:weight,:statement,:memo)
            end
        end
    end
end