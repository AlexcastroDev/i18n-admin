require 'swagger_helper'

describe Api::VersionController, vcr: true do
  path '/api/version' do
    get 'Returns api version', focus: true do
      tags 'Api'
      produces 'application/json'
      consumes 'application/json'

      response '200', 'Should return the API Version' do

      run_test! do |response|
        # VCR.use_cassette('Api::VersionController//api/version/get/Should return the API Version/returns a 200 respons') do
        #   Net::HTTP.get_response('rnters-staging.herokuapp.com', '/api/item_categories').body
        # end
        a = VCR
        b = VCR.current_cassette
        body = JSON.parse(response.body)
        expect(body['version']).to eq('1.0.0')
      end
    end
  end
  end
end
