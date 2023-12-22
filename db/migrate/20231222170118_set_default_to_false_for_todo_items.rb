# frozen_string_literal: true

class SetDefaultToFalseForTodoItems < ActiveRecord::Migration[7.1]
  def change
    change_column_default :todo_items, :completed, false
  end
end
