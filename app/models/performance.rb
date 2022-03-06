class Performance < ApplicationRecord
   attribute :show_dates, DateRangeType.new
   validates :title, presence: true
end
