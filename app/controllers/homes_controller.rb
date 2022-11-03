# frozen_string_literal: true

class HomesController < ApplicationController
  before_action :authenticate_admin!
end
