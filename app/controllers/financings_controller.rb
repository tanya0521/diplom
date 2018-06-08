class FinancingsController < ApplicationController
  before_action :set_financing, only: [:show, :edit, :update, :destroy]

  # GET /financings
  # GET /financings.json
  def index
    @financings = Financing.all
  end

  # GET /financings/1
  # GET /financings/1.json
  def show
    if params.has_key?("suum")
      @s = params[:suum] #фонд
      @a = params[:a]    #кол-во отличников
      @b = params[:b]    #Кол-во хорошистов
      @c = params[:c]
      
      
      @s = 50000000   #фонд
      @a = 1257       #кол-во отличников
      @b = 3083       #Кол-во хорошистов
      @c = 1.5        #Коэффициент
      @x = (@s/5)/(@a+@b/@c) #стипения отличников
      @y = @x/@c #стипения хорошистов
      @k = ((@x-(@x.round(-2)))*@a*4).round # остаток от округления отл
      @m = ((@y-(@y.round(-2)))*@b*4).round # остаток от округления хор
      @x = @x.round(-2) # округл стип отл
      @y = @y.round(-2) # округл стип хор
      @f = @x*4 # округл стип отл за 4 мес
      @l = @y*4 # округл стип хор за 4 мес
      @d = @s/5+@k+@m
      @x2 = @d/(@a+@b/@c)
      @y2 = @x2/@c
      @x2 = @x2.round
      @y2 = @y2.round
      @i  = @x*@a+@y*@b
      @i2 = @x2*@a+@y2*@b
      
      
    end
  end

  # GET /financings/new
  def new
    @financing = Financing.new
  end

  # GET /financings/1/edit
  def edit
  end

  # POST /financings
  # POST /financings.json
  def create
    @financing = Financing.new(financing_params)

    respond_to do |format|
      if @financing.save
        format.html { redirect_to @financing, notice: 'Данные о финансировании успешно созданы.' }
        format.json { render :show, status: :created, location: @financing }
      else
        format.html { render :new }
        format.json { render json: @financing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /financings/1
  # PATCH/PUT /financings/1.json
  def update
    respond_to do |format|
      if @financing.update(financing_params)
        format.html { redirect_to @financing, notice: 'Данные о финансировании успешно отредактированы.' }
        format.json { render :show, status: :ok, location: @financing }
      else
        format.html { render :edit }
        format.json { render json: @financing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /financings/1
  # DELETE /financings/1.json
  def destroy
    @financing.destroy
    respond_to do |format|
      format.html { redirect_to financings_url, notice: 'Данные о финансировании успешно удалены.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_financing
      @financing = Financing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def financing_params
      params.require(:financing).permit(:name_financing, :suum, :faculty_id, :scholarship_period_id, :type_scholarship_id)
    end
end
