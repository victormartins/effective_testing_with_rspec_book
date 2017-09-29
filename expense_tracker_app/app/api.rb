require 'sinatra/base'
require 'json'
require 'securerandom'

module ExpenseTracker
  class API < Sinatra::Base
    post '/expenses' do
      JSON.generate('expense_id' => SecureRandom.uuid )
    end

    get '/expenses/:date' do
      JSON.generate([])
    end
  end
end
