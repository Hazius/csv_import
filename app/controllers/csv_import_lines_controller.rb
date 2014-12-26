class CsvImportLinesController < ApplicationController
  before_action :set_csv_import_line, only: [:show, :edit, :update, :destroy]

  # GET /csv_import_lines
  # GET /csv_import_lines.json
  def index
    @csv_import_lines = CsvImportLine.all
  end

  # GET /csv_import_lines/1
  # GET /csv_import_lines/1.json
  def show
  end

  # GET /csv_import_lines/new
  def new
    @csv_import_line = CsvImportLine.new
  end

  # GET /csv_import_lines/1/edit
  def edit
  end

  # POST /csv_import_lines
  # POST /csv_import_lines.json
  def create
    @csv_import_line = CsvImportLine.new(csv_import_line_params)

    respond_to do |format|
      if @csv_import_line.save
        format.html { redirect_to @csv_import_line, notice: 'Csv import line was successfully created.' }
        format.json { render :show, status: :created, location: @csv_import_line }
      else
        format.html { render :new }
        format.json { render json: @csv_import_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /csv_import_lines/1
  # PATCH/PUT /csv_import_lines/1.json
  def update
    respond_to do |format|
      if @csv_import_line.update(csv_import_line_params)
        format.html { redirect_to @csv_import_line, notice: 'Csv import line was successfully updated.' }
        format.json { render :show, status: :ok, location: @csv_import_line }
      else
        format.html { render :edit }
        format.json { render json: @csv_import_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /csv_import_lines/1
  # DELETE /csv_import_lines/1.json
  def destroy
    @csv_import_line.destroy
    respond_to do |format|
      format.html { redirect_to csv_import_lines_url, notice: 'Csv import line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_csv_import_line
      @csv_import_line = CsvImportLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def csv_import_line_params
      params.require(:csv_import_line).permit(:article, :title, :size, :csv_import_id)
    end
end
