class QrCode < ApplicationRecord
    validates :title, :qr_url, presence: true
end
