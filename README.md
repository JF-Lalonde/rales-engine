# Rails Sales (aka Rales) Engine Project
## Created by Andrew Mossefin and JF Lalonde

### Rales Engine is a revisiting of the business intelligence and relationships found in the Black Thursday project. This time around, CSVs are used to populate a database, and the analytics are performed using SQL/ActiveRecord.

## Getting Started
* This project uses Ruby 2.4.1 and Rails 5.0 on a Postgres Database. All testing is done using RSpec. All the gems and dependencies for this project can be installed by bundling.
* If you do not have the bundle gem, in the terminal type:
` gem install bundle `
* Then ` bundle `
* Create database ` rake db:create `
* Then migrate the database ` rake db:migrate `
* In order to populate the database tables, type ` rake populate `
* In order to run the test suite type ` rspec `
