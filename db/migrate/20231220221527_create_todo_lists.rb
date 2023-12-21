# frozen_string_literal: true

class CreateTodoLists < ActiveRecord::Migration[7.1]
  def change
    create_table :todo_lists do |t|
      t.string :title
      t.belongs_to :account, null: true, foreign_key: true

      t.timestamps
    end
  end
end
