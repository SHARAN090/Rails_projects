class SubtasksController < ApplicationController

    def index
        @task = Task.find(params[:task_id])
        @subtasks = Subtask.view_subtasks(@task)
    end

    def new
        @task = Task.find(params[:task_id])
        @subtask = Subtask.new
    end

    def create
        @task = Task.find(params[:task_id])

        @subtask = Subtask.create_subtask(
            @task, subtask_params[:name], 
            subtask_params[:description]
        )
        if @subtask.persisted?
            redirect_to task_subtasks_path(@task), notice: 'Subtask was successfully created.'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @task = Task.find(params[:task_id])
        @subtask = Subtask.find(params[:id])
    end

    def update
        @task = Task.find(params[:task_id])
        @subtask = Subtask.find(params[:id])

        if @subtask.update_subtask(
            subtask_params[:name], 
            subtask_params[:description]
        )
            redirect_to task_subtasks_path(@task)
        else
            render :edit, status: :unprocessable_entity
        end

        def destroy
            @task = Task.find(params[:task_id])
            @subtask = Subtask.find(params[:id])

            @subtask.delete_subtask

            redirect_to task_subtasks_path(@task)
        end

        private

        def subtask_params
            params.require(:subtask).permit(
                :name, 
                :description
            )
        end

    end


