json.extract! payment_status, :id, :student_id, :created_at, :updated_at
json.url payment_status_url(payment_status, format: :json)
