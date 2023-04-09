module Api
    module V1
        class TasksController < ApplicationController
            before_action :set_task, only: [:show, :update, :destroy,:show_subtasks,:create_subtask]
            before_action :set_user_tasks,only:[:index,:done_tasks,:user_tasks,:do_tasks,:date_tasks,:goal_tasks,:goal_done_tasks,:tree]
            def index
                tasks=@tasks.where(statement: false,).roots
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

            def create_subtask
                @newtask=Task.new(task_params)
                if @task.add_child(@newtask)
                    render json:@newtask
                else
                    render json: @task.errors, status: :unprocessable_entitiy
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
                tasks=@tasks.where(statement: true).roots
                render json: tasks, include:[:subtasks],status: 200
            end

            def do_tasks
                tasks=@tasks.where(statement:false).where(box: params[:box]).roots
                render json: tasks, include:[:subtasks],status: 200
            end

            def date_tasks
                tasks=@tasks.where(statement:false).where(date: params[:date]).roots
                render json: tasks,include:[:subtasks],status: 200
            end

            def goal_tasks
                tasks=@tasks.where(statement:false).where(goal: params[:goal])
                render json: tasks,include:[:subtasks],status: 200
            end
            def goal_done_tasks
                tasks=@tasks.where(statement:true).where(goal:params[:goal])
                render json: tasks, include:[:subtasks],status:200
            end
            
            def show_subtasks
                tasks=@task.children.where(statement:false)
                render json:tasks,status:200
            end
            private
            def set_task
                @task = Task.find(params[:id])
            end

            def set_user_tasks
                @tasks=Task.where(user_id: params[:id])
            end

            def task_params
                params.require(:task).permit(:user_id,:name,:box,:date,:due_date,:weight,:statement,:memo,:goal,:parent_id)
            end
        end
    end
end