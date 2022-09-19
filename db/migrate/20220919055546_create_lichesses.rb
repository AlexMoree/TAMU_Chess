class CreateLichesses < ActiveRecord::Migration[6.1]
  def change
    create_table :lichesses do |t|
      t.integer :student_id
      t.string :username
      t.integer :rank
      t.integer :total_played
      t.integer :win
      t.integer :draw
      t.integer :loss

      t.timestamps
    end
  end
end
