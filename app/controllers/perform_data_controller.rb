class PerformDataController < ApplicationController
  before_action :set_perform_datum, only: [:show, :edit, :update, :destroy]

  # GET /perform_data
  # GET /perform_data.json
  def index
    @perform_data = PerformDatum.all
  end

  # GET /perform_data/1
  # GET /perform_data/1.json
  def show
  end

  # GET /perform_data/new
  def new
    @perform_datum = PerformDatum.new
  end

  # GET /perform_data/1/edit
  def edit
  end

  # POST /perform_data
  # POST /perform_data.json
  def create
    @perform_datum = PerformDatum.new(perform_datum_params)

    respond_to do |format|
      if @perform_datum.save
        format.html { redirect_to @perform_datum, notice: 'Данные об успеваемости успешно созданы.' }
        format.json { render :show, status: :created, location: @perform_datum }
      else
        format.html { render :new }
        format.json { render json: @perform_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perform_data/1
  # PATCH/PUT /perform_data/1.json
  def update
    respond_to do |format|
      if @perform_datum.update(perform_datum_params)
        format.html { redirect_to @perform_datum, notice: 'Данные об успеваемости успешно отредактированы.' }
        format.json { render :show, status: :ok, location: @perform_datum }
      else
        format.html { render :edit }
        format.json { render json: @perform_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perform_data/1
  # DELETE /perform_data/1.json
  def destroy
    @perform_datum.destroy
    respond_to do |format|
      format.html { redirect_to perform_data_url, notice: 'Данные об успеваемости успешно удалены.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perform_datum
      @perform_datum = PerformDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def perform_datum_params
      params.require(:perform_datum).permit(:quantity5, :quantity4, :quantity3, :quantity2, :student_id, :scholarship_period_id)
    end
end
