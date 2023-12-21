# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TodoListsController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/todo_lists').to route_to('todo_lists#index')
    end

    it 'routes to #show' do
      expect(get: '/todo_lists/1').to route_to('todo_lists#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/todo_lists').to route_to('todo_lists#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/todo_lists/1').to route_to('todo_lists#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/todo_lists/1').to route_to('todo_lists#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/todo_lists/1').to route_to('todo_lists#destroy', id: '1')
    end
  end
end
