require 'sinatra'
require 'date'
require 'action_view'
include ActionView::Helpers::TextHelper

EVENT_DATES = [{:message => "The man burns in", :date => Date.new(2012, 9, 1)},
               {:message => "The gate opens in", :date => Date.new(2012, 8, 27)}]

TICKET_DATES = [{:message => "The pre-sale ticket round closes in", :date => Date.new(2011, 12, 11)},
                {:message => "The pre-sale ticket lottery is drawn in", :date => Date.new(2011, 12, 19)},
                {:message => "The main sale ticket round opens in", :date => Date.new(2012, 1, 9)},
                {:message => "The main sale ticket round closes in", :date => Date.new(2012, 1, 22)},
                {:message => "The main-sale ticket lottery is drawn in", :date => Date.new(2012, 2, 1)},
                {:message => "The Secure Ticket Exchange Program launches in", :date => Date.new(2012, 2, 29)}]

get '/' do
  @dates = EVENT_DATES.map { |date| {:message => date[:message], :days_till => (date[:date] - Date.today).to_i } }

  TICKET_DATES.each do |date|
    if date[:date] > Date.today
      @dates << {:message => date[:message], :days_till => (date[:date] - Date.today).to_i}
      break
    end
  end

  haml :index
end
