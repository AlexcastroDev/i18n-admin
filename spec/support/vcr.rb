# Add VCR
# https://benoittgt.github.io/vcr/#/test_frameworks/rspec_metadata
VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.allow_http_connections_when_no_cassette = true

  config.default_cassette_options = {
    record: :once,
    match_requests_on: [:method, :host, :path]
  }
  config.allow_http_connections_when_no_cassette = true

  config.debug_logger = File.open("tmp/vcr.log", "w")
end

