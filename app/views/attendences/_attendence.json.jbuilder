# frozen_string_literal: true

json.extract! attendence, :uin, :day_of_event
json.url attendence_url(attendence, format: :json)
