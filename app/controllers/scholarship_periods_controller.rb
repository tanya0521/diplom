class ScholarshipPeriodsController < ApplicationController
  before_action :set_scholarship_period, only: [:show, :edit, :update, :destroy]

  # GET /scholarship_periods
  # GET /scholarship_periods.json
  def index
    @scholarship_periods = ScholarshipPeriod.all
  end

  # GET /scholarship_periods/1
  # GET /scholarship_periods/1.json
  def show
  end

  # GET /scholarship_periods/new
  def new
    @scholarship_period = ScholarshipPeriod.new
  end

  # GET /scholarship_periods/1/edit
  def edit
  end

  # POST /scholarship_periods
  # POST /scholarship_periods.json
  def create
    @scholarship_period = ScholarshipPeriod.new(scholarship_period_params)

    respond_to do |format|
      if @scholarship_period.save
        format.html { redirect_to @scholarship_period, notice: 'Период степендии успешно создан.' }
        format.json { render :show, status: :created, location: @scholarship_period }
      else
        format.html { render :new }
        format.json { render json: @scholarship_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scholarship_periods/1
  # PATCH/PUT /scholarship_periods/1.json
  def update
    respond_to do |format|
      if @scholarship_period.update(scholarship_period_params)
        format.html { redirect_to @scholarship_period, notice: 'Период степендии успешно отредактирован.' }
        format.json { render :show, status: :ok, location: @scholarship_period }
      else
        format.html { render :edit }
        format.json { render json: @scholarship_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scholarship_periods/1
  # DELETE /scholarship_periods/1.json
  def destroy
    @scholarship_period.destroy
    respond_to do |format|
      format.html { redirect_to scholarship_periods_url, notice: 'Период степендии успешно удален.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scholarship_period
      @scholarship_period = ScholarshipPeriod.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scholarship_period_params
      params.require(:scholarship_period).permit(:begin, :end)
    end
end
