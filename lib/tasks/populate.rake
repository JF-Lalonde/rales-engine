require 'CSV'

@filenames = ["customers", "invoice_items", "invoices", "items", "merchants", "transactions"]

desc "Populates the six CSV files into the database"
task :populate do
  @filenames.each do |filename|
    csv_text = File.read("./app/data/#{filename}.csv")
    csv = CSV.parse(csv_text, headers: true)
    csv.each do |row|
      (filename.camelize.constantize).create!(row.to_hash)
    end
  end
end
