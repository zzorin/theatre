class Performance < ApplicationRecord
  attribute :show_dates, DateRangeType.new
  validates :title, presence: true
  validate :not_empty_dates
  validate :end_after_start, :if => Proc.new { |obj| obj.dates_valid? }
  validate :not_overlap

  scope :overlaps, ->(start_date, end_date) do
    where "(((show_dates).start_date <= ?) and ((show_dates).end_date >= ?))", end_date, start_date
  end

  def dates_valid?
    show_dates.start_date && show_dates.end_date
  end

  def overlaps
    Performance.overlaps show_dates.start_date, show_dates.end_date
  end

  private

  def not_empty_dates
    unless dates_valid?
      errors.add(:show_dates, "Dates can't be blank")
    end
  end

  def end_after_start
    if show_dates.start_date > show_dates.end_date
      errors.add(:show_dates, "End date can't be before start date")
    end
  end

  def not_overlap
    if overlaps.exists?
      errors.add(:show_dates, "Range can't overlap with an existing one")
    end
  end

end
