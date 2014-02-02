require 'request_tracer/log'

module Rack
  class RequestTracer

    @@enabled = false

    def self.enabled=(value)
      @@enabled = value
    end

    def initialize(app)
      @app = app
    end

    def call(env)
      trace(env) if @@enabled
      @app.call(env)
    end

    private

    def log
      Log.instance
    end

    def trace(env)
      log.trace Rack::Request.new(env)
    end

  end
end
