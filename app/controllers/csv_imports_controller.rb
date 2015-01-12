require 'csv'
require 'open-uri'

class CsvImportProcessor

  def initialize(file)
    @file = file
  end

  # Получаем первую строку (массив заголовков)
  def header
    rows[0]
  end

  # Получаем строки с данными (двумерный массив)
  def body
    result = rows
    result.delete_at(0)
    result
  end

  private
    #############################################################
    # Пример массива на выходе:
    # [
    #   ["title", "producer_price"],
    #   ["Шиповки спринт ЭЛИТ (б у)", "7369"],
    #   ["Шиповки СПРИНТ КЛАССИКА(новяк)", "8219"]
    # ]
    #############################################################
    def rows(with_headers = false)
      csv_data = open(@file, "r:UTF-8")
      CSV.parse(csv_data.read, headers: with_headers) # :encoding => 'windows-1251:utf-8'
    end

end

class CsvImportsController < ApplicationController
  before_action :set_csv_import, only: [:show, :edit, :update, :destroy, :process_in_db]

  # GET /csv_imports
  # GET /csv_imports.json
  def index
    @csv_imports = CsvImport.all
  end

  # GET /csv_imports/1
  # GET /csv_imports/1.json
  def show
  end

  # GET /csv_imports/new
  def new
    @csv_import = CsvImport.new
  end

  # GET /csv_imports/1/edit
  def edit
  end

  # POST /csv_imports
  # POST /csv_imports.json
  def create
    @csv_import = CsvImport.new(csv_import_params)
    if @csv_import.save
      # csvImportProcessor = CsvImportProcessor.new(@csv_import.file.current_path)
      csvImportProcessor = CsvImportProcessor.new(@csv_import.file_from_storage)
      @csv_import.add_lines csvImportProcessor.body
    else
      format.html { render :new }
      format.json { render json: @csv_import.errors, status: :unprocessable_entity }
    end

    respond_to do |format|
      if @csv_import.save
        format.html { redirect_to @csv_import, notice: 'Csv import was successfully created.' }
        format.json { render :show, status: :created, location: @csv_import }
      else

      end
    end
  end

  def process_in_db
    @csv_import.csv_import_lines.each do |line|
      # Update db...
    end
    @csv_import[:proccessed_at] = Time.now
    if @csv_import.save
      redirect_to csv_import_path(@csv_import)
    else
      render :show
    end
  end

  # PATCH/PUT /csv_imports/1
  # PATCH/PUT /csv_imports/1.json
  def update
    respond_to do |format|
      if @csv_import.update(csv_import_params)
        format.html { redirect_to @csv_import, notice: 'Csv import was successfully updated.' }
        format.json { render :show, status: :ok, location: @csv_import }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /csv_imports/1
  # DELETE /csv_imports/1.json
  def destroy
    @csv_import.destroy
    respond_to do |format|
      format.html { redirect_to csv_imports_url, notice: 'Csv import was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_csv_import
      @csv_import = CsvImport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def csv_import_params
      params.require(:csv_import).permit(:file, :proccessed_at)
    end
end
