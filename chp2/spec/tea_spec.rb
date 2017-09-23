class Tea
  def flavor
    :earl_grey
  end
end

RSpec.configure do |config|
  config.example_status_persistence_file_path = 'spec/examples.txt'
end

RSpec.describe Tea do
  let(:tea) { Tea.new }

  it 'tastes like Earl Grey', foo: 1 do
    expect(tea.flavor).to be :earl_grey
  end

  it 'is hot', foo: 2 do
    expect(tea.temperature).to be > 200.0
  end
end
