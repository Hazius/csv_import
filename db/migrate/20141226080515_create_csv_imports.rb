class CreateCsvImports < ActiveRecord::Migration
  def change
    create_table :csv_imports do |t|
      t.string :file
      t.datetime :proccessed_at

      t.timestamps
    end
  end
end
