class CreateTodo < ActiveRecord::Migration 
  def change 
    create_table :todos do |t|
      t.string :content
      t.boolean :complete
    end
  end
end