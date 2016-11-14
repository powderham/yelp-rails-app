require 'rails_helper'

describe Restaurant do
  subject(:restaurant) { described_class.new }

  it 'can be created' do
    expect(restaurant).to be_truthy
  end
end
