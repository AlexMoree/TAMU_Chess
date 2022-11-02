# frozen_string_literal: true

class CreateQrCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :qr_codes do |t|
      t.string :title
      t.string :qr_url
    end
  end
end
