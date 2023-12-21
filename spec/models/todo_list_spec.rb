# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TodoList do
  context 'When user is attached' do
    let(:account) { create(:account) }

    it 'todo list can be created' do
      expect { account.todo_lists.create(title: 'TItle') }.to change(described_class, :count).by(1)
    end
  end

  context 'When user is not attached' do
    it 'todo list can be created' do
      expect { described_class.create(title: 'TItle') }.to change(described_class, :count).by(1)
    end
  end

  describe 'Validations' do
    context 'when parameters are valid' do
      it 'todo list can be created' do
        expect { create(:todo_list) }.to change(described_class, :count).by(1)
      end
    end

    context 'when parameters are invalid' do
      it { is_expected.to validate_presence_of(:title) }
    end
  end
end
