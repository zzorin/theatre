require 'rails_helper'

RSpec.describe Performance, type: :model do
  it 'is invalid without a title' do
    performance = Performance.new(title: nil)
    performance.valid?
    expect(performance.errors[:title]).to include("can't be blank")
  end
end
