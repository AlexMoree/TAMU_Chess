class QrCode < ApplicationRecord

    validates :qr_url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "incorrect url format" }
    validates :title, :qr_url, presence: true
end