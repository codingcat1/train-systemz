require 'pg'
require 'line'
require 'stop'
require 'station'
require 'pry'


DB = PG.connect({:dbname => "train_test"})

RSpec.configure do |config|
  config.before(:each) do
    DB.exec("DELETE FROM lines *;")
    DB.exec("DELETE FROM stops *;")
    DB.exec("DELETE FROM stations *;")
  end
end

def setup
  @test_line = Line.new({:name => "Orient Express"})
  @test_station = Station.new({:name => "Limbo"})
  @test_stop = Stop.new({:line_id => 1, :station_id => 3})
end
