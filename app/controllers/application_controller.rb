class ApplicationController < ActionController::Base
  before_action :authenticate_admin!, except: :new
end
