require 'CSV'

@filenames = ["customer", "merchant", "invoice", "item", "invoice_item", "transaction"]

desc "Populates the six CSV files into the database"
task :populate => :environment do
  @filenames.each do |filename|
    CSV.foreach("./app/data/#{filename}s.csv", headers: true, header_converters: :symbol) do |row|
      (filename.camelize.constantize).create!(row.to_hash)
      puts row
    end
  end
end
