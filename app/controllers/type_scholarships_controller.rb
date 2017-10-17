class TypeScholarshipsController < ApplicationController
  before_action :set_type_scholarship, only: [:show, :edit, :update, :destroy]

  # GET /type_scholarships
  # GET /type_scholarships.json
  def index
    @type_scholarships = TypeScholarship.all
  end

  # GET /type_scholarships/1
  # GET /type_scholarships/1.json
  def show
  end

  # GET /type_scholarships/new
  def new
    @type_scholarship = TypeScholarship.new
  end

  # GET /type_scholarships/1/edit
  def edit
  end

  # POST /type_scholarships
  # POST /type_scholarships.json
  def create
    @type_scholarship = TypeScholarship.new(type_scholarship_params)

    respond_to do |format|
      if @type_scholarship.save
        format.html { redirect_to @type_scholarship, notice: 'Type scholarship was successfully created.' }
        format.json { render :show, status: :created, location: @type_scholarship }
      else
        format.html { render :new }
        format.json { render json: @type_scholarship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_scholarships/1
  # PATCH/PUT /type_scholarships/1.json
  def update
    respond_to do |format|
      if @type_scholarship.update(type_scholarship_params)
        format.html { redirect_to @type_scholarship, notice: 'Type scholarship was successfully updated.' }
        format.json { render :show, status: :ok, location: @type_scholarship }
      else
        format.html { render :edit }
        format.json { render json: @type_scholarship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_scholarships/1
  # DELETE /type_scholarships/1.json
  def destroy
    @type_scholarship.destroy
    respond_to do |format|
      format.html { redirect_to type_scholarships_url, notice: 'Type scholarship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_scholarship
      @type_scholarship = TypeScholarship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def type_scholarship_params
      params.require(:type_scholarship).permit(:name_financing, :typescholarship)
    end
end
