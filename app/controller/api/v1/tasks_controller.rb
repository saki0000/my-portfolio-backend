module Api
    module V1
      class TasksController < ApplicationController
        before_action :set_task, only: [:show, :update, :destroy]
        def index
            @tasks=Task.where(statement: false)
            render json: { status: :ok, data: @tasks }
        end

        def show
            render json: @task
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
            @tasks=Task.where(statement: true)
            render json: { status: :ok, data: @tasks }
        end
        private
        def set_task
            @task = Task.find(params[:id])
        end

        def task_params
            params.require(:task).permit(:user_id,:name,:date,:due_date,:weight,:statement,:memo)
        end

      end
    end
  end