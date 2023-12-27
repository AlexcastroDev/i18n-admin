require 'swagger_helper'

describe Api::VersionController, vcr: true do
  path '/api/version' do
    get 'Returns api version' do
      tags 'Api'
      produces 'application/json'
      consumes 'application/json'

      response '200', 'Should return the API Version' do

      run_test! do |response|
        body = JSON.parse(response.body)
        expect(body['version']).to eq('1.0.0')
      end
    end
  end
  end
end
