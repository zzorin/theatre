class CreatePerformances < ActiveRecord::Migration[6.1]
  def up
    execute <<~SQL
      CREATE TYPE date_range as (
        start_date date,
        end_date date
      );
    SQL
    create_table :performances do |t|
      t.string :title, null: false
      t.column :show_dates, :date_range
      t.timestamps
    end
  end

  def down
    drop_table :performances
    execute "DROP TYPE date_range"
  end
end
