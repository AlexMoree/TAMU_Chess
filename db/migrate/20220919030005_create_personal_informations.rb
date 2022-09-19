class CreatePersonalInformations < ActiveRecord::Migration[6.1]
  def change
    create_table :personal_informations do |t|
      t.integer :student_id
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :classification
      t.string :major

    end
  end
end
