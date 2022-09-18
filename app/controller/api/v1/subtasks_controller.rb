module Api
    module V1
        class SubtasksController < ApplicationController
            before_action :set_task,only: [:update,:destroy]
            def index
                @subtasks=Subtask.where(task_id:params[:task_id])
                render json:@subtasks
            end
            def create
                @subtask=Subtask.new(task_id:params[:task_id],
                    name:task_params[:name],
                    box:task_params[:box],
                    date:task_params[:date],
                    due_date:task_params[:due_date],
                    weight:task_params[:weight],
                    statement:task_params[:statement],
                    memo:task_params[:memo])
                if @subtask.save
                    render json: @subtask
                else
                    render json: @subtask.errors, status: :unprocessable_entity
                end
            end

            def update
                
                if @subtask.update(task_id:params[:task_id],
                    name:task_params[:name],
                    box:task_params[:box],
                    date:task_params[:date],
                    due_date:task_params[:due_date],
                    weight:task_params[:weight],
                    statement:task_params[:statement],
                    memo:task_params[:memo])
                    render json: @subtask
                else
                    render json: @subtask.errors, status: :unprocessable_entity
                end
            end
            def destroy
                @subtask.destroy
            end
            private
            def set_task
                @subtask = Subtask.find(params[:id])
            end
            def task_params
                params.require(:subtask).permit(:name,:box,:date,:due_date,:weight,:statement,:memo)
            end
        end
    end
end
