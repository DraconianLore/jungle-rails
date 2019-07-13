# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.
Using Ruby and Rails along with Sass and using postgres for the database, I took this project from being riddled with bugs and terrible design to where it is now, learning ruby on rails from scratch in the week I worked on this project.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account(if you want to test checkout)
7. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Screenshot

![Jungle on rails screenshot](./public/jungle-screenshot.png)

