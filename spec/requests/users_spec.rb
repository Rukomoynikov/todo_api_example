# spec/requests/blogs_spec.rb
require 'swagger_helper'

describe 'Users API' do

  path '/create-account' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string },
          'password-confirm': { type: :string }
        },
        required: [ 'email', 'password', 'password-confirm' ]
      }

      response '200', 'user created' do
        let(:user) { { email: 'email@email.com',
            password: '1@87email@email.com',
            'password-confirm': '1@87email@email.com' } }

        run_test! do |response|
          expect(Account.count).to eq(1)
        end
      end
    end
  end

  # path '/verify-account' do
  #   post 'Verify a user' do
  #     tags 'Users'
  #     consumes 'application/json'
  #     parameter name: :user, in: :body, schema: {
  #       type: :object,
  #       properties: {
  #         key: { type: :string },
  #       },
  #       required: [ 'key' ]
  #     }

  #     response '200', 'user verified' do
  #       let(:user) { { email: 'email@email.com',
  #           password: '1@87email@email.com',
  #           'password-confirm': '1@87email@email.com' } }

  #       run_test! do |response|
  #           byebug
  #         p response
  #         expect(Account.count).to eq(1)
  #       end
  #     end
  #   end
  # end
end
