# Robot Factory Coding Challenge
## Getting Started
The owner of a factory producing toy robots requires software to manage the stages of the production line. They already have built a Single Page React App for this purpose. They need you to build the Backend API, which can support the front end app to perform QA on robots built in the factory.
Assume that there is already a inventory management software for registering the new robots for QA. You don’t have build API for registering the robots for QA into this backend.
To simplify things you can mimic registration of robots behaviour by generating the robots with different configurations and populating the database in the backend(e.g rake task). When the frontend app ask for robots for QA you can return that collection.

### Prerequisites
* Ruby version: ruby 2.4.2p198
* Database: Postgres 9.1+ (should support array)
* RVM or RBENV or similar

### Installation

* Install Gem (on terminal)
```
gem install bundler
bundle install
```

* Setting up the database and seed file (on terminal)
```
rake db:create db:migrate db:seed
```

* Starting the Project (on terminal)
```
rails s
```

* Running the specs (on terminal)
```
rspec .
```

### Implementation

* TDD Methodology

* MODEL DESIGN
I have 3 main models `robot`, `configuration` and `shipment`

*Robot* has two attributes, `name` and `statuses`. The reasons why i choose to use array data type on `statuses` is because I think its better to just store array of interger/string and utilize postgres functionality in storing data rather than creating another database model and doing a join call to a thousands of records.

*Configuration*

*Shipments* I created shipments because of the requirement that it would need to create shipments on the last action

* Implementation of API
I used [Active Model Serializer](https://github.com/rails-api/active_model_serializers/tree/0-10-stable) to  bring convention in JSON generation.

* Controller
I used kaminari for pagination or batches accepting two different `params[:per_page]` or `params[:batches]` I'm not sure which the FE will use on this. 

* No versioning was mentioned on the specs(tho i really want to implement versioning).
