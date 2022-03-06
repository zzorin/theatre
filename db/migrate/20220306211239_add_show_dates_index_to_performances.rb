class AddShowDatesIndexToPerformances < ActiveRecord::Migration[6.1]
  def up
    execute <<~SQL
      CREATE INDEX performance_show_dates_index
      ON performances (((show_dates).start_date), ((show_dates).end_date));
    SQL
  end

  def down
    remove_index :partners, name: "performance_show_dates_index"
  end
end
