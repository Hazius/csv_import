class CsvImport < ActiveRecord::Base
  mount_uploader :file, CsvUploader

  has_many :csv_import_lines, dependent: :destroy

  def add_line(row)
    line = csv_import_lines.new
    line[:article] = row[0]
    line[:title] = row[1]
    line[:size] = row[2]
    line.save
  end

  def add_lines (rows)
    rows.each do |row|
      add_line row
    end
  end

  def file_from_storage
    file.file_from_storage
  end

end
