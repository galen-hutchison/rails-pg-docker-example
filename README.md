# README

Sample of dockerized rails app

## First time set up on Windows 10
You must have [wsl2](https://docs.microsoft.com/en-us/windows/wsl/install-win10) and [docker-desktop](https://docs.docker.com/desktop/windows/install/) installed first


clone repo

```
docker-compose up
```
this should build and run the image, if it is the first time this will take a few minutes. You should eventually see some output saying it is awaiting connections:

```
web_1  | => Booting Puma
web_1  | => Rails 6.1.4.1 application starting in development
web_1  | => Run `bin/rails server --help` for more startup options
web_1  | Puma starting in single mode...
web_1  | * Puma version: 5.4.0 (ruby 2.7.4-p191) ("Super Flight")
web_1  | *  Min threads: 5
web_1  | *  Max threads: 5
web_1  | *  Environment: development
web_1  | *          PID: 9
web_1  | * Listening on http://0.0.0.0:3000
web_1  | Use Ctrl-C to stop
```

then create the database
```
docker-compose run web bundle exec rake db:create 
```
run the migrations
```
docker-compose run web rake db:migrate
```

this initializes the webpack manifest
```
docker-compose run web yarn
```
