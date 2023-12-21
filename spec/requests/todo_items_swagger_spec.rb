# frozen_string_literal: true

require 'rails_helper'
require 'swagger_helper'

describe 'TodoItems API' do
  path '/todo_items' do
    post 'Attaches todo item to todo list' do
      tags 'TodoItem'
      consumes 'application/json'
      parameter name: :todo_item, in: :body, schema: {
        type: :object,
        properties: {
          body: { type: :string },
          todo_list_id: { type: :number }
        },
        required: ['body']
      }

      response '201', 'todo list created' do
        let(:todo_list) { TodoList.create(title: 'Title new') }
        let(:todo_item) { { body: 'New title', todo_list_id: todo_list.id } }

        run_test! do |response|
          response_body = JSON.parse response.body
          expect(response_body['body']).to eq('New title')
        end
      end
    end
  end
end
