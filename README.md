```ruby
gem 'simple_form'
gem 'carrierwave'

rails g simple_form:install
rails g scaffold CsvImport file proccessed_at:datetime

rails g model CsvImportLine article title size csv_import:belongs_to
rails g uploader Csv

rake db:migrate
```
