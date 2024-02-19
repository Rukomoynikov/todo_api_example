# frozen_string_literal: true

require 'rails_helper'
require 'swagger_helper'

describe 'Todo API' do
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
  end

  path '/todo_lists/{id}' do
    get 'Retrieve a todo list' do
      tags 'TodoList'
      consumes 'application/json'

      parameter name: :id, in: :path, type: :string
        response '200', 'one todo list retrieved' do
          todo_list = TodoList.create(title: 'New title')
          todo_list.todo_items.create(body: 'New body')

          let(:id) { todo_list.id }

          run_test! do |response|
            content = response.parsed_body
            expect(content['todo_items'].count).to eq(1)
          end
        end
    end

    delete 'Delete todo list' do
      tags 'TodoList'
      consumes 'application/json'

      parameter name: :id, in: :path, type: :string
      response '204', 'one todo list removed' do
        todo_list = TodoList.create(title: 'New title')
        todo_list.todo_items.create(body: 'New body')

        let(:id) { todo_list.id }

        run_test! do
          expect(TodoList.find_by(id: todo_list.id)).to be_nil
        end
      end
    end
  end
end
