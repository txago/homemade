# Homemade Marketplace App

This is a simple marketplace app, made using Ruby, Rails and a few gems like Devise, Cloudinary and Postgres Search.

The app was generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), and it was made as one of the final projects for [Le Wagon's coding bootcamp](https://www.lewagon.com).

## Project specifications
* **Ruby v. 2.6.5**
* **Gems dependencies:** 'bootstrap', 'devise, 'cloudinary', 'pg', 'pg-search', 'webpack', 'faker', 'autoprefixer-rails', 'font-awesome-sass' and 'simple_form'  gems.
* **Configuration:** environment configs can be found at `config/webpack/` and services at `config/database.yml` and `config/storage.yml` files.
* **Database creation:** `rails db:create`
* **Database initialization:** `rails db:migrate`. Run `rails db:seed` to populate the database with fake product and user data.
* **Deployment instructions:** after running database commands, run `git push heroku master` and `heroku run rails db:migrate` to send project to Heroku.

Visit Homemade app at https://homemade-thayvf.herokuapp.com/.
