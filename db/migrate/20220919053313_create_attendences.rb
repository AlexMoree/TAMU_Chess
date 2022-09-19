class CreateAttendences < ActiveRecord::Migration[6.1]
  def change
    create_table :attendences do |t|
      t.integer :event_id
      t.string :event_name
      t.date :event_date
      t.integer :attendence, array: true, default: []

    end
  end
end
