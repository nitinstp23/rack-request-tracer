# Rack::Request::Tracer

A Rack Middleware to log request's info to any rack app.

## Installation

Add this line to your application's Gemfile:

  `gem 'rack-request-tracer'`

And then execute:

  `$ bundle`

Or install it yourself as:

  `$ gem install rack-request-tracer`

## Configuration

### Rails 3.x/4.x

Create an initializer `config/initializers/request_tracer.rb` and these lines:

```ruby
  require 'rack/request_tracer'

  Rack::RequestTracer.enabled = true if Rails.env.production? # enable for production environment,
                                                              # disabled for other environments

  # Build the Log singleton.
  Rack::RequestTracer::Log.instance(
    file: '/path/to/log_file.log', # example - /var/log/request_tracer.log
    level: 'info', # set the log severity
    rotation: 'weekly' # log rotation period
  )

  Rails.application.config.middleware.use Rack::RequestTracer
```


### Rack Apps

In your `config.ru` file add the following lines:

```ruby
  require 'rack/request_tracer'

  Rack::RequestTracer.enabled = true

  # Build the Log singleton.
  Rack::RequestTracer::Log.instance(
    file: '/path/to/log_file.log', # example - /var/log/request_tracer.log
    level: 'info', # set the log severity
    rotation: 'weekly' # log rotation period
  )

  use Rack::RequestTracer
```

## Download

You can also clone the project with Git by running:

  `$ git clone git://github.com/nitinstp23/rack-request-tracer`


## Roadmap
* Make request's info to be logged, configurable.


## Authors
* Nitin Misra: https://github.com/nitinstp23


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
