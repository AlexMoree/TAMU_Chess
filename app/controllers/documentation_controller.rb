# frozen_string_literal: true

class DocumentationController < ApplicationController
  before_action :authenticate_admin!
  def index; end
end
