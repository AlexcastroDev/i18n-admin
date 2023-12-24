require 'rails_helper'

describe "Api::LanguagesController", type: :request, vrc: true do
  path '/api/languages' do
    get 'Get Languages' do
      tags 'Languages'
      produces 'application/json'
      consumes 'application/json'


      response '200', 'Should list all language', focus: true do
        let(:language) { FactoryBot.create(:language) }

        run_test! do |response|
          binding.pry
          body = JSON.parse(response.body)
          expect(body.count).to eq(1)
          expect(body.dig(0, 'key')).to eq('en-GB')
        end
      end
    end

    post 'Languages' do
      tags 'Create Languages'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :body, in: :body, schema: {
        '$ref' => '#/definitions/createLanguage'
      }

      response '201', 'Should create a new language' do
        let!(:body) { {
          key: 'en-GB',
          label: 'English'
        } }

        run_test!
      end
      response '422', 'Should not process missing key' do
        let!(:body) { {
          label: 'English'
        } }

        run_test!
      end
      response '422', 'Should not process missing label' do
        let!(:body) { {
          key: 'en-GB'
        } }

        run_test!
      end
    end
  end
end
