require 'sinatra/base'
require 'json'
require 'securerandom'

module ExpenseTracker
  class API < Sinatra::Base
    post '/expenses' do
      JSON.generate('expense_id' => SecureRandom.uuid )
    end

    get '/expenses/:date' do
      puts ''
      puts '-' * 50
      puts "PAGE 62".center(50)
      puts '-' * 50
      puts ''
      JSON.generate([])
    end
  end
end
