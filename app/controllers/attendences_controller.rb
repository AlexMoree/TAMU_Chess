# frozen_string_literal: true

class AttendencesController < ApplicationController
  before_action :authenticate_admin!, except: %i[new show create]
  before_action :set_attendence, only: %i[show edit update destroy]
  # GET /attendences or /attendences.json
  def index
    @attendences = Attendence.all

    @attendences = Attendence.order(params[:sort])
  end

  # GET /attendences/1 or /attendences/1.json
  def show; end

  # GET /attendences/new
  def new
    @attendence = Attendence.new
  end

  # GET /attendences/1/edit
  def edit; end

  # POST /attendences or /attendences.json
  def create
    @attendence = Attendence.new(attendence_params)

    respond_to do |format|
      if @attendence.save
        format.html { redirect_to attendence_url(@attendence), notice: 'Attendence was successfully created.' }
        format.json { render :show, status: :created, location: @attendence }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attendence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendences/1 or /attendences/1.json
  def update
    respond_to do |format|
      if @attendence.update(attendence_params)
        format.html { redirect_to attendence_url(@attendence), notice: 'Attendence was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendence }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attendence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendences/1 or /attendences/1.json
  def destroy
    @attendence.destroy

    respond_to do |format|
      format.html { redirect_to attendences_url, notice: 'Attendence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_attendance_table
    t = Time.now
    x = t.strftime('%m%d')

    past_attendances = Attendence.all

    if x == '1231' || x == '0602'
      past_attendances.each do |past_attendance|
        past_attendance.destroy
      end
    end
  end
  helper_method :update_attendance_table

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_attendence
    @attendence = Attendence.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def attendence_params
    params.require(:attendence).permit(:uin, :day_of_event)
  end
end
