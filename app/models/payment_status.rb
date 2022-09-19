class PaymentStatus < ApplicationRecord
    belongs_to :personal_information, :optional => true
end
