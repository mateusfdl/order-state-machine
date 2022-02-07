## Getting started

1 - Install docker: [Docker Install Docs](https://docs.docker.com/install/)

2 - Clone this project

3 - Go to the project folder

4 - Build a Docker image, so you don't have to rebuild-it every time: `docker-compose build`

5 - Run the application database and server: `docker-compose up -d`

6 - Setup the database: `docker-compose exec server rails db:create db:migrate`

7 - To run suit test just `docker-compose exec server rspec spec/`

8 - To create orders and transact state machine [localhost:3000/orders](http://localhost:3000/orders)

9 - have fun 😄!

## Stopping Application

1 - Just run `docker-compose down && sudo rm -Rf tmp/`
