# PlanRadar Technical Assessment

This project provides a standalone service that can be used to remind users of upcoming due dates for their assigned tickets.

Currently, one endpoint is provided to which a ticket ID can be posted, for example from a separate service such as a ticket management system.

The `User` and `Ticket` models are based on the provided schema:


<img width="417" alt="Screenshot 2024-01-22 at 20 01 56" src="https://github.com/mjdobbins12/d1d3d037-fa3f-42c3-b792-b032063b5735/assets/51956973/f6c813b7-febe-4bdb-88b8-10b155ec4997">


## Requirements

- Ruby >= 3.1
- PostgreSQL >= 14.10
- Redis >= 7.2

## Setup

- Create a PostgreSQL database entitled `plan_radar_challenge_development`
- Ensure that PostgreSQL and Redis are running on the local system on ports 5432 and 6379 respectively
- Add the PostgreSQL user credentials to a `.env.development` file:
```
DATABASE_PASSWORD=<your password>
DATABASE_USERNAME=<your username>
```
- From the application root, run `bundle install`
- Run `rails db:migrate` to create the tables backing the `User` and `Ticket` models used in the application
- Start the Rails server with `rails s`
- Start Sidekiq by running `bundle exec sidekiq`

## Running tests

- Create a PostgreSQL database entitled plan_radar_challenge_test
- Run all tests with `bundle exec rspec`

## Usage

- Insert a few records in the `users` and `tickets` tables in the `plan_radar_challenge_development` database
- Send a POST request to localhost:3000/reminder/<ticket_id> (where ticket_id is the `id` of the previously-created ticket) to enqueue a reminder email for the assignee of the ticket
