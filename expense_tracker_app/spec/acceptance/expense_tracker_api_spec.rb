require 'rack/test'
require 'json'
require 'bigdecimal'

require_relative '../../app/api'

module ExpenseTracker
  RSpec.describe 'Expense Tracker API' do
    include Rack::Test::Methods

    def app
      ExpenseTracker::API.new
    end

    def post_expense(expense)
      post '/expenses', JSON.generate(expense)
      expect(last_response.status).to eq(200)

      parsed = JSON.parse(last_response.body)
      expect(parsed).to include('expense_id' => a_kind_of(String))

      expense.merge(parsed['expense_id'])
    end

    it 'records submitted expenses' do
      # coffee = post_expense(
      #   'payee'  => 'Starbucks',
      #   'amount' => BigDecimal.new('5.75'),
      #   'date'   => '2017-06-10'
      # )
      #
      # zoo = post_expense(
      #   'payee'  => 'Zoo',
      #   'amount' => BigDecimal.new('15.25'),
      #   'date'   => '2017-06-10'
      # )
      #
      # groceries = post_expense(
      #   'payee'  => 'Whole Foods',
      #   'amount' => BigDecimal.new('95.20'),
      #   'date'   => '2017-06-11'
      # )

      puts ''
      puts '-' * 50
      puts "I'M ON PAGE 55".center(50)
      puts '-' * 50
      puts ''

    end
  end
end
