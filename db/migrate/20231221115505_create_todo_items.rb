# frozen_string_literal: true

class CreateTodoItems < ActiveRecord::Migration[7.1]
  def change
    create_table :todo_items do |t|
      t.string :body
      t.belongs_to :todo_list, null: false, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
  end
end
