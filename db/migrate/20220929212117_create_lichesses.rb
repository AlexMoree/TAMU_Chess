class CreateLichesses < ActiveRecord::Migration[6.1]
  def change
    create_table :lichesses do |t|
      t.string :actual_name
      t.string :lichess_org_username
      t.integer :blitz
      t.integer :rapid
      t.integer :total_played

    end
  end
end