# 🛰️ ISS tracking app

A Ruby app created using the [Sinatra](https://sinatrarb.com/) framework and the [OpenNotify APIs](http://api.open-notify.org/).

## Table of contents

- [About](#about)
- [Concepts covered](#concepts-covered)
- [Setup & getting started](#setup-&-getting-started)
- [Author](#author)

## About

This is an app for allowing users to see the whereabouts of the International Space Station (ISS) with the following requirements:
* Show the current astronauts that are in space either in a table or a list
* Show the location of ISS on the 'position' page
* Use simple CSS to make the layout really clear
* Show the location data as JSON at the 'iss_position.json' endpoint

## Concepts covered

* Sinatra: a Ruby web framework showcasing the basic setup of routes and views.

* Views and Templates: The app uses embedded Ruby (ERB) templates for rendering HTML views.

* External API Integration: The app fetches data from the OpenNotify API service using the Faraday library. It shows how to make HTTP requests to an external API and handle the response.

* JSON Integration: To data in JSON format, the response content type was set to JSON and converted to JSON using the to_json method.

* Testing with Rack::Test and Rspec framework: The current tests cover basic functionality, such as checking response status and contents

* Gem Management with Bundler: The app utilises Bundler to manage gem dependencies. The bundle config path vendor/bundle command sets the gem installation path, and bundle install installs the required gems based on the Gemfile.


## Setup & getting started

Firstly you'll want to download and unzip the code into a directory or folder of your choice.

Next if you've not already got Ruby, you'll need to [install it](https://www.ruby-lang.org/en/documentation/installation/).  There are a number of different ways to do it depending on your operating system.  The challenge needs **at least Ruby v3** to run.

Once you've installed ruby, you can install the dependencies for this project in a terminal.  You should open a terminal in the directory or folder where your code has been checked out.

```shell
bundle config path vendor/bundle
bundle install
```

Then to start it:

```shell
bundle exec ruby app.rb
```

and you should be able to see it at http://localhost:4567.  **NB** When you make changes to your code, you'll need to stop the app, using `ctrl+c` and then restart it using the same command above.

To run tests:

```shell
bin/rspec ./spec/app_spec.rb --format doc
```

------------------

## Author

👤 **HJ Kang** 
- GitHub [@cocomarine](https://github.com/cocomarine) 
- LinkedIn [@hj-kang07](https://www.linkedin.com/in/hj-kang07/) 




