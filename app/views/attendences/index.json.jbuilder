# frozen_string_literal: true

json.array! @attendences, partial: 'attendences/attendence', as: :attendence
