require 'sinatra'
require 'date'

DATES = {:burn => Date.new(2012, 9, 1),
         :gate => Date.new(2012, 8, 27),
         :tickets => Date.new(2012, 1, 18)}

get '/' do
  @days_till = DATES.merge(DATES) { |event, date| (date - Date.today).to_i }

  haml :index
end
