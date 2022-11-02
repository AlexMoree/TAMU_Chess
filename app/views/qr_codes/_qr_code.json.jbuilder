# frozen_string_literal: true

json.extract! qr_code, :title, :qr_url
json.url qr_code_url(qr_code, format: :json)
