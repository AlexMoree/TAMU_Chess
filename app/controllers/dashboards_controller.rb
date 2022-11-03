# frozen_string_literal: true

class DashboardsController < ApplicationController
  before_action :authenticate_admin!

  def show; end
end
