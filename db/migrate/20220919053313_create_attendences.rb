# frozen_string_literal: true

class CreateAttendences < ActiveRecord::Migration[6.1]
  def change
    create_table :attendences do |t|
      t.string :uin
      t.date :day_of_event
    end
  end
end
