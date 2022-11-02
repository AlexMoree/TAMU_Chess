# frozen_string_literal: true

class PersonalInformationsController < ApplicationController
  before_action :authenticate_admin!, except: :new
  before_action :set_personal_information, only: %i[show edit update destroy]

  # GET /personal_informations or /personal_informations.json
  def index
    @personal_informations = if params[:paid] == 'true'
                               PersonalInformation.where(membership: true)
                             else
                               PersonalInformation.where(membership: false)
                             end

    @personal_informations = PersonalInformation.order(params[:sort])
  end

  # GET /personal_informations/1 or /personal_informations/1.json
  def show; end

  # GET /personal_informations/new
  def new
    @personal_information = PersonalInformation.new
  end

  # GET /personal_informations/1/edit
  def edit; end

  # POST /personal_informations or /personal_informations.json
  def create
    @personal_information = PersonalInformation.new(personal_information_params)

    respond_to do |format|
      if @personal_information.save
        format.html { redirect_to personal_information_url(@personal_information), notice: 'Personal information was successfully created.' }
        format.json { render :show, status: :created, location: @personal_information }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @personal_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_informations/1 or /personal_informations/1.json
  def update
    respond_to do |format|
      if @personal_information.update(personal_information_params)
        format.html { redirect_to personal_information_url(@personal_information), notice: 'Personal information was successfully updated.' }
        format.json { render :show, status: :ok, location: @personal_information }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @personal_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_informations/1 or /personal_informations/1.json
  def destroy
    @personal_information.destroy

    respond_to do |format|
      format.html { redirect_to personal_informations_url, notice: 'Personal information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def semester_start
    # use instance variable to communicate with V
  end

  def semester_end
    # use instance variable to communicate with V
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_personal_information
    @personal_information = PersonalInformation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def personal_information_params
    params.require(:personal_information).permit(:uin, :first_name, :last_name, :email, :membership, :start_date, :end_date, :discord_username, :chess_com_username, :lichess_org_username)
  end
end
