require 'csv'

puts "Starting seed..."

puts "Delete previous transactions..."
Transaction.delete_all

puts "Loading transactions..."
transactions = []
data_path = File.join(Rails.root, 'db', 'data', 'memory-data.csv')
CSV.foreach(data_path, headers: true).with_index do |row, idx|
  transactions << Transaction.new(row.to_h)
  puts "#{idx}+ transactions loaded" if idx != 0 && (idx % 100_000).zero?
end

puts "Inserting transactions in db..."
Transaction.import transactions

puts "#{Transaction.count} transactions created"

puts "Seed completed"
