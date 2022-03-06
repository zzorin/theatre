require 'rails_helper'

RSpec.describe Performance, type: :model do
  describe 'title validations' do
    it 'is invalid without a title' do
      performance = Performance.new(title: nil)
      performance.valid?
      expect(performance.errors[:title]).to include("can't be blank")
    end
  end
  describe 'show_dates validations' do
    context 'show_dates are nil' do
      it 'returns validation error' do
        performance = Performance.new(show_dates: nil)
        performance.valid?
        expect(performance.errors[:show_dates]).to include("Dates can't be blank")
      end
    end
    context 'end_date before start_date' do
      it 'returns validation error' do
        performance = Performance.new(title: 'title', show_dates: "(#{Date.today},#{Date.yesterday})")
        performance.valid?
        expect(performance.errors[:show_dates]).to include("End date can't be before start date")
      end
    end
    context 'range overlapping' do
      before { Performance.create(title: 'title', show_dates: "(#{10.days.ago},#{10.days.since})") }
      context 'range overlaps existing' do
        it 'returns validation error' do
          performance = Performance.new(title: 'title', show_dates: "(#{Date.yesterday},#{Date.today})")
          performance.valid?
          expect(performance.errors[:show_dates]).to include("Range can't overlap with an existing one")
        end
      end
      context 'range does not overlap existing' do
        it 'no validation errors' do
          performance = Performance.new(title: 'title', show_dates: "(#{11.days.since},#{11.days.since})")
          expect(performance.valid?).to be_truthy
        end
      end
    end
  end
end
