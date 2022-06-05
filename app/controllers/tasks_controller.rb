# frozen_string_literal: true

class TasksController < ApplicationController
  resources: tasks, param: :identifier_name
  def index
    tasks = Task.all
    render status: :ok, json: { tasks: tasks }
  end
  def create
    task = Task.new(task_params)
    task.save!
    render status: :ok, json: { notice: 'Task was successfully created' }
  end

  private

    def task_params
      params.require(:task).permit(:title)
    end
  def show
    @task = Task.find_by(identifier_name: params[:identifier_name])
  end
  def create
    task = Task.new(task_params)
    task.save!
    respond_with_success(t("successfully_created"))
  end


end
