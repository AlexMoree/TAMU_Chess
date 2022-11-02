class Attendence < ApplicationRecord
    has_many :personal_informations

    validates :uin, length: { minimum: 9, maximum: 9 },numericality: { only_integer: true }
    validates :uin, :day_of_event, presence: true
end
