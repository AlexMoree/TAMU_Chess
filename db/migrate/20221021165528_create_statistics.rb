# frozen_string_literal: true

class CreateStatistics < ActiveRecord::Migration[6.1]
  def change
    create_table :statistics do |t|
      t.string :actual_name
      t.string :chess_username
      t.integer :chess_blitz
      t.integer :chess_rapid
      t.integer :chess_total_played
      t.string :lichess_username
      t.integer :lichess_blitz
      t.integer :lichess_rapid
      t.integer :lichess_total_played
    end
  end
end
