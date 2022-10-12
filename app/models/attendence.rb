class Attendence < ApplicationRecord
    has_many :personal_informations

    validates :uin, :day_of_event, presence: true
end
