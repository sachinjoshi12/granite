# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    tasks = Task.all
    render status: :ok, json: { tasks: tasks }
  end
  resources: tasks, param: :identifier_name
  def show
    @task = Task.find_by(identifier_name: params[:identifier_name]);
  end
end
