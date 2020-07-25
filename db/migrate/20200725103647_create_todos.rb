class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.text :title
      t.text :description
      t.boolean :finished

      t.timestamps
    end
  end
end
