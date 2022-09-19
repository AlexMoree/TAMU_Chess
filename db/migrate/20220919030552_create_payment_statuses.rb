class CreatePaymentStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_statuses do |t|
      t.integer :student_id
      t.boolean :membership
      t.date :start_date
      t.date :end_date 

    end
  end
end
