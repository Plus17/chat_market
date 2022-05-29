## Introduction
Hello! We are Sergio, Mauricio and Cecilia, the Baltimore team!

This is the project we developed in about 15 hours for the FIN hackathon in Mexico City.

Our proposal is a platform that will allow Fintual's employees to switch their weekly chat shifts when they have a particular problem.

## Setup project
git clone
cd


## Development with Docker

### Makefile

For convenience, you can use the commands included in the Makefile:

| Command                                                           | Description                                           |
| ----------------------------------------------------------------- | ----------------------------------------------------- |
| `make bootstrap`                                                  | Bootstrap the phoenix project (dependencies & databse)|
| `make deps.get`                                                   | Gets & compile dependencies                           |
| `make deps.clean`                                                 | Clean unused dependencies & remove from mix.lock      |
| `make seeds`                                                      | Run seeds                                             |
| `make reset`                                                      | Resets the project removing deps & builds             |
| `make ecto.setup`                                                 | Setup the database for dev                            |
| `make ecto.reset`                                                 | Resets the database for dev                           |
| `make ecto.reset.test`                                            | Resets the database for test                          |
| `make test`                                                       | Runs tests                                            |
| `make check.all`                                                  | Run all CI verifications (formatter, credo, coverage) |
| `make run`                                                        | Start **Phoenix** server                              |
| `make gettext`                                                    | Search & merge new translations                       |
| `make format`                                                     | Format all phoenix files                              |


# ChatMarket

To start your Chat Market server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).
