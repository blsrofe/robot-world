require_relative '../models/robot.rb'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/robots' do
    @robots = Robot.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    robot = Robot.new(params)
    robot.save
    redirect '/robots'
  end

  get '/robots/:id' do
    @robot = Robot.find(params[:id])
    erb :show
  end

  get '/robots/:id/edit' do
    @robot = Robot.find(params[:id])
    erb :edit
  end

  put '/robots/:id' do
    id = params[:id].to_i
    Robot.update(id, params)
    redirect "/robots/#{id}"
  end

  delete '/robots/:id' do
    id = params[:id].to_i
    Robot.destroy(id)
    redirect '/robots'
  end
end
