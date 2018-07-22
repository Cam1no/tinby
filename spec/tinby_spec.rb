RSpec.describe Tinby do
  it 'has a version number' do
    expect(Tinby::VERSION).not_to be nil
  end

  it '.greet' do
    expect(Tinby.greet).to eq 'Hello World!'
  end
end
