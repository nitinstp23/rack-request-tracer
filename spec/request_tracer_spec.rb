require 'spec_helper.rb'

describe Rack::RequestTracer do

  subject { Rack::RequestTracer }

  before do
    app = ->(env) do
      [200, {'Content-Type' => 'text/html'}, ['It Works!']]
    end

    # Build Log singleton
    @log = Rack::RequestTracer::Log.instance(
      file: '/tmp/request_tracer.log',
      level: 'info',
      rotation: 'weekly'
    )

    @request_mock = Rack::MockRequest.new(subject.new(app))
  end

  describe '#call' do
    describe 'Rack::RequestTracer.enabled = true' do
      it 'log request info' do
        subject.enabled = true

        @log.stub(:trace) { true }

        @request = @request_mock.get('/dummy_uri', {'HTTP_ACCEPT' => 'text/html'})

        @request.status.should == 200
        @request.body.should   == 'It Works!'
      end
    end

    describe 'Rack::RequestTracer.enabled = false' do
      it 'does not log request info' do
        subject.enabled = false

        # Stubbed to raise exception,
        # but this won't be executed as enabled is false.
        @log.stub(:trace) { raise StandardError, 'This should not happen!' }

        @request = @request_mock.get('/dummy_uri', {'HTTP_ACCEPT' => 'text/html'})
        @request.status.should == 200
        @request.body.should   == 'It Works!'
      end
    end
  end

end
