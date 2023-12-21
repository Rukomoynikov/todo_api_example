# frozen_string_literal: true

require 'rails_helper'
require 'swagger_helper'

describe 'Blogs API' do
  path '/todo_lists' do
    post 'Creates a todo list' do
      tags 'TodoList'
      consumes 'application/json'
      parameter name: :todo_list, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string }
        },
        required: ['title']
      }

      response '201', 'blog created' do
        let(:todo_list) { { title: 'New title' } }
        run_test! do |response|
          response_body = JSON.parse response.body
          expect(response_body['title']).to eq('New title')
        end
      end

      response '422', 'invalid request' do
        let(:todo_list) { { title: '' } }
        run_test!
      end
    end

    get 'Retreive todo list' do
      tags 'TodoList'
      consumes 'application/json'
      parameter name: :todo_list, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :string }
        },
        required: ['id']
      }

      response '200', 'one todo list retreived' do
        let(:todo_list) { { id: TodoList.create(title: 'New title').id } }
        run_test!
      end
    end
  end
end
