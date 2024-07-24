class PatientRequestsController < ApplicationController
  before_action :set_patient_request, only: %i[ show edit update destroy ]

  def set_queue_position(patient_request)
    # Define weights
    w_p = 1.0
    w_i = 2.0
    w_t = 0.1
    
    ## Calculate time factor in hours
    time_now = Time.current
    time_difference = time_now - patient_request.created_at
    time_factor = time_difference / 1.hour

    return (patient_request.pain * w_p) + 5 - (time_factor * w_t)

  end

  # GET /patient_requests or /patient_requests.json
  def index
    @patient_requests = PatientRequest.all
  end

  # GET /patient_requests/1 or /patient_requests/1.json
  def show
  end

  # GET /patient_requests/new
  def new
    @patient_request = PatientRequest.new
  end

  # GET /patient_requests/1/edit
  def edit
  end

  # POST /patient_requests or /patient_requests.json
  def create
    
    @patient_request = PatientRequest.new(patient_request_params)
    respond_to do |format|
      if @patient_request.save
        @patient_request.queue_position = set_queue_position(@patient_request)
        @patient_request.save
        format.html { redirect_to patient_request_url(@patient_request), notice: "Patient request was successfully created." }
        format.json { render :show, status: :created, location: @patient_request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @patient_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patient_requests/1 or /patient_requests/1.json
  def update
    respond_to do |format|
      if @patient_request.update(patient_request_params)
        format.html { redirect_to patient_request_url(@patient_request), notice: "Patient request was successfully updated." }
        format.json { render :show, status: :ok, location: @patient_request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @patient_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_requests/1 or /patient_requests/1.json
  def destroy
    @patient_request.destroy!

    respond_to do |format|
      format.html { redirect_to patient_requests_url, notice: "Patient request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient_request
      @patient_request = PatientRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def patient_request_params
      params.require(:patient_request).permit(:user_id, :description, :image, :status, :pain, :queue_position, :injury_type)
    end

end
