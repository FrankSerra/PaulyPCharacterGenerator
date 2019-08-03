require 'sqlite3'

db = SQLite3::Database.open 'db/development.sqlite3'
results = db.query 'SELECT ID, NAME from races'

results.each do |row|
  puts row.join(', ')
end
