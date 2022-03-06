class DateRange
  attr_accessor :start_date, :end_date

  def initialize(values)
    dates = values ? sanitize_string(values) : [nil, nil]
    @start_date = dates[0]
    @end_date = dates[1]
  end

  def sanitize_string(values)
    values.delete("()").split(',').map(&:to_date)
  end

  def to_s
    "(#{start_date},#{end_date})"
  end
end
