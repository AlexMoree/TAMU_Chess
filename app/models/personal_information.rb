class PersonalInformation < ApplicationRecord
    has_many :chesses
    has_many :lichesses

    belongs_to :attendence, :optional => true

    validates :uin, length: { minimum: 9, maximum: 9 }
    validates :uin, :first_name, :last_name, :email, :start_date, :end_date, presence: true
end