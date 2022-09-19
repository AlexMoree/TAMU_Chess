class PaymentStatusesController < ApplicationController
  before_action :set_payment_status, only: %i[ show edit update destroy ]

  # GET /payment_statuses or /payment_statuses.json
  def index
    @payment_statuses = PaymentStatus.all
  end

  # GET /payment_statuses/1 or /payment_statuses/1.json
  def show
  end

  # GET /payment_statuses/new
  def new
    @payment_status = PaymentStatus.new
  end

  # GET /payment_statuses/1/edit
  def edit
  end

  # POST /payment_statuses or /payment_statuses.json
  def create
    @payment_status = PaymentStatus.new(payment_status_params)

    respond_to do |format|
      if @payment_status.save
        format.html { redirect_to payment_status_url(@payment_status), notice: "Payment status was successfully created." }
        format.json { render :show, status: :created, location: @payment_status }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_statuses/1 or /payment_statuses/1.json
  def update
    respond_to do |format|
      if @payment_status.update(payment_status_params)
        format.html { redirect_to payment_status_url(@payment_status), notice: "Payment status was successfully updated." }
        format.json { render :show, status: :ok, location: @payment_status }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_statuses/1 or /payment_statuses/1.json
  def destroy
    @payment_status.destroy

    respond_to do |format|
      format.html { redirect_to payment_statuses_url, notice: "Payment status was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_status
      @payment_status = PaymentStatus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_status_params
      params.require(:payment_status).permit(:student_id, :membership, :start_date, :end_date)
    end
end
