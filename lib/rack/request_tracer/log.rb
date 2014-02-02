require 'logger'

module Rack
  class RequestTracer
    class Log < ::Logger

      # class variables
      @@instance = nil

      private_class_method :new
      private_class_method :allocate

      # instance accessor
      def self.instance(file: nil, level: 'debug', rotation: 'daily')
        return @@instance if @@instance
        raise ArgumentError, 'Missing :file argument' if file.nil?
        @@instance = new(file, level, rotation)
      end

      def initialize(file, level, rotation)
        super(file, rotation)
        self.level = extract_level!(level)
      end

      def trace(request)
        info "| #{request.ip} | #{request.request_method} | #{request.url} | #{request.params}"
      end

      private

      def extract_level!(level)
        level = level.to_s.upcase
        raise StandardError, 'Unkown LOG LEVEL' unless self.class.const_defined?(level)
        self.class.const_get(level)
      end

    end
  end
end
