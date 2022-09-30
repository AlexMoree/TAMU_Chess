class Attendence < ApplicationRecord
    validates :uin, :day_of_event, presence: true
end
