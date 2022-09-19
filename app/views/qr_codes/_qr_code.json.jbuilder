json.extract! qr_code, :id, :event_id, :attendence_link, :signup_link, :created_at, :updated_at
json.url qr_code_url(qr_code, format: :json)
