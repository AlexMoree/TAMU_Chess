class PersonalInformation < ApplicationRecord
    has_many :payment_statuses

    validates :student_id, :first_name, :last_name, :date_of_birth, :classification, :major, presence: true
end
