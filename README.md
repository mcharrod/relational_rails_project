# relational_rails

This is a rails app with a one - to - many relationship database, completed as part of the Turing School of Software and Design curriculum. The database design can be found [here](https://app.dbdesigner.net/designer/schema/484695). The spec requirements can be found [here](https://backend.turing.edu/module2/projects/relational_rails). The one to many relationship I set was frogs to bogs. 

![table design](img src="https://github.com/mcharrod/relational_rails_project/blob/add_image/Pic/Tables.png" width="200" height="100")


## gems 

The Gemfile Lock will have all of the versions I used at the time of creating this project. 

For this project I used ruby 2.7.2 and rails 5.2.6 

The gems I used are 
- Launchy 
- Rspec rails 
- Capybara 
- Shoulda - Matchers 
- Pry 
- Simplecov 
- Orderly 

## set up 

After you've cloned down this repository to your machine, you will need to run `bundle install` to use the gems used and then `rails db:{drop,create,migrate,seed}` to set up the database. This project uses the RSpec testing suite and so you will want to run `bundle exec rspec` to run the tests. 


## future ideas 

While doing this project, I realized that my model validations will need to have some way of confirming that the boolean attribute is, in fact, a boolean. Currently, I know how to do this in Ruby, and I would like to learn how to do this utilizing an ActiveRecord Validation.
