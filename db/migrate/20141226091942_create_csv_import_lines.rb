class CreateCsvImportLines < ActiveRecord::Migration
  def change
    create_table :csv_import_lines do |t|
      t.string :article
      t.string :title
      t.string :size
      t.belongs_to :csv_import, index: true

      t.timestamps
    end
  end
end
