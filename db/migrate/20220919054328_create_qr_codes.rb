class CreateQrCodes < ActiveRecord::Migration[6.1]
  def change
    create_table :qr_codes do |t|
      t.integer :event_id
      t.string :attendence_link

    end
  end
end
