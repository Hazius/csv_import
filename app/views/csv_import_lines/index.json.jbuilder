json.array!(@csv_import_lines) do |csv_import_line|
  json.extract! csv_import_line, :id, :article, :title, :size, :csv_import_id
  json.url csv_import_line_url(csv_import_line, format: :json)
end
