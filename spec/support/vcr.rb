require 'vcr'
require 'webmock/rspec'

# Add VCR
# https://benoittgt.github.io/vcr/#/test_frameworks/rspec_metadata
VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr'
  config.hook_into :webmock
  config.configure_rspec_metadata!

  config.default_cassette_options = {
    :record => :once,
    :match_requests_on => [:method, :host, :path],
  }

  config.ignore_localhost = false
end
