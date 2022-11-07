# frozen_string_literal: true

json.array! @statistics, partial: 'statistics/statistic', as: :statistic
