require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  def draw(routes_name)
    instance_eval(File.read(Rails.root.join("config/routes/#{routes_name}.rb")))
  end

  draw :sidekiq

  #previous routes as is
