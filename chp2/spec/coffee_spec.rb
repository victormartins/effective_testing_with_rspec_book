require './spec_helper'

class Coffee
  require 'bigdecimal'

  KNOWN_INGREDIENTS = {
    milk: { price: 0.25 }
  }

  def ingredients
    @ingredients ||= []
  end

  def add(ingredient)
    ingredients << ingredient
  end

  def price
    1.00 + ingredient_prices
  end

  private

  def ingredient_prices
    ingredients.inject(BigDecimal.new('0')) do |sum, ingredient|
      sum + price_for(ingredient)
    end
  end

  def price_for(ingredient)
    data = KNOWN_INGREDIENTS[ingredient]
    raise "ingredient [#{ingredient}] not found!" unless data
    data[:price]
  end
end

RSpec.describe 'A cup of coffee' do
  let(:coffee) { Coffee.new }

  it 'costs $1' do
    # pending 'not implemented'
    expect(coffee.price).to eq(1.00)
  end

  context 'with milk' do
    before { coffee.add :milk }

    it 'costs $1.25' do
      expect(coffee.price).to eq(1.25)
    end
  end

  context 'with an unkown ingredient' do
    before { coffee.add :unicorn_blood }

    it 'raises an error' do
      expect{ coffee.price }.to raise_error("ingredient [unicorn_blood] not found!")
    end
  end
end
