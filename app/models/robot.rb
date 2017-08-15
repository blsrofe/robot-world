require 'sqlite3'

attr_reader :name,
            :city,
            :state,
            :department,
            :id

class Robot
  def initialize(robot_params)
    @name = robot_params["name"]
    @city = robot_params["city"]
    @state = robot_params["state"]
    @department = robot_params["department"]
    @database = SQLite3::Database.new('db/robot_world_development.db')
    @database.results_as_hash = true
    @id = robot_params["id"] if robot_params["id"]
  end

  def self.all
    database
    robots = database.execute("SELECT * FROM robots")
    robots.map do |robot|
      Robot.new(robot)
    end
  end

  def self.database
  database = SQLite3::Database.new('db/robot_world_development.db')
  database.results_as_hash = true
  database
  end

  def save
    @database.execute("INSERT INTO robots (name, city, state, email) VALUES (?, ?, ?, ?);", @name, @city, @state, @email)
  end
end
