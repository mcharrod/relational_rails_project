# relational_rails

This is a rails app with a one - to - many relationship database, completed as part of the Turing School of Software and Design curriculum. The database design is as seen below. The spec requirements for this project can be found [here](https://backend.turing.edu/module2/projects/relational_rails). As a representation for a one to many relationship could be chosen, my models are frogs and bogs. 

![table design](https://github.com/mcharrod/relational_rails_project/blob/main/Pic/Tables.png)


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

After you've cloned down this repository to your machine, you will need to run `bundle install` to use the gems used and then `rails db:{drop,create,migrate,seed}` to set up the database. This project uses the RSpec testing suite and so you will want to run `bundle exec rspec` to run the tests. To see my app in action, you can go to start up the server with the `rails s` command in your terminal and then visit [http://localhost:3000/](http://localhost:3000/) 


## future ideas 

While doing this project, I realized that my model validations will need to have some way of confirming that the boolean attribute is, in fact, a boolean. Currently, I know how to do this in Ruby, and I would like to learn how to do this utilizing an ActiveRecord Validation. 

My alphabetize method and my filter by threshold method each work independently, so the user is able to see the full index alphabetized OR the unordered index reduced to objects that meet the threshold. I am interested in learning how I would build an app that can take an altered list, and then provide further alterations to that list rather than applying one alteration to the same base list. Specifically, I want the user to be able to apply a filter, and then continue adding filters, rather than them happening simultaneously which may not be desired. This could probably be created with a conditional statement within that action in our respective controller files.
