# frozen_string_literal: true

json.extract! statistic, :id, :actual_name, :created_at, :updated_at
json.url statistic_url(statistic, format: :json)
