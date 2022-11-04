# frozen_string_literal: true

class CreatePersonalInformations < ActiveRecord::Migration[6.1]
  def change
    create_table :personal_informations do |t|
      t.string :uin
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :membership
      t.date :start_date
      t.date :end_date
      t.string :discord_username
      t.string :chess_com_username
      t.string :lichess_org_username
    end
  end
end
