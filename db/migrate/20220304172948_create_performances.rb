class CreatePerformances < ActiveRecord::Migration[6.1]
  def change
    create_table :performances do |t|
      t.string :title, null: false
      t.date :start_date, null: false
      t.interval :duration, null: false
      t.timestamps
    end
  end
end
