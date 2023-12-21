# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/todo_items' do
  # This should return the minimal set of attributes required to create a valid
  # TodoItem. As you add validations to TodoItem, be sure to
  # adjust the attributes here as well.
  #
  let(:todo_list) do
    create(:todo_list)
  end

  let(:valid_attributes) do
    attributes_for(:todo_item, todo_list_id: todo_list.id)
  end

  let(:invalid_attributes) do
    attributes_for(:todo_item, body: nil)
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # TodoItemsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      TodoItem.create! valid_attributes
      get todo_items_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      todo_item = TodoItem.create! valid_attributes
      get todo_item_url(todo_item), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new TodoItem' do
        expect do
          post todo_items_url,
               params: { todo_item: valid_attributes }, headers: valid_headers, as: :json
        end.to change(TodoItem, :count).by(1)
      end

      it 'renders a JSON response with the new todo_item' do
        post todo_items_url,
             params: { todo_item: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new TodoItem' do
        expect do
          post todo_items_url,
               params: { todo_item: invalid_attributes }, as: :json
        end.not_to change(TodoItem, :count)
      end

      it 'renders a JSON response with errors for the new todo_item' do
        post todo_items_url,
             params: { todo_item: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { body: 'New body' }
      end

      it 'updates the requested todo_item' do
        todo_item = TodoItem.create! valid_attributes

        expect do
          patch todo_item_url(todo_item),
                params: { todo_item: new_attributes }, headers: valid_headers, as: :json
          todo_item.reload
        end.to change(todo_item, :body)
      end

      it 'renders a JSON response with the todo_item' do
        todo_item = TodoItem.create! valid_attributes
        patch todo_item_url(todo_item),
              params: { todo_item: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the todo_item' do
        todo_item = TodoItem.create! valid_attributes
        patch todo_item_url(todo_item),
              params: { todo_item: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested todo_item' do
      todo_item = TodoItem.create! valid_attributes
      expect do
        delete todo_item_url(todo_item), headers: valid_headers, as: :json
      end.to change(TodoItem, :count).by(-1)
    end
  end

  describe 'PATCH /toggle' do
    context 'with valid parameters' do
      let(:todo_item) { create(:todo_item) }

      it 'toggles completed for the requested todo_item' do
        expect do
          patch toggle_todo_item_url(todo_item), as: :json
          todo_item.reload
        end.to change(todo_item, :completed)
      end
    end
  end
end
