class CreateChesses < ActiveRecord::Migration[6.1]
  def change
    create_table :chesses do |t|
      t.string :actual_name
      t.string :chess_com_username
      t.integer :blitz
      t.integer :rapid
      t.integer :total_played
      
    end
  end
end
