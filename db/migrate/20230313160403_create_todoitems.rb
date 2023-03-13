class CreateTodoitems < ActiveRecord::Migration[6.0]
  def change
    create_table :todoitems do |t|
      t.string :description

      t.timestamps
    end
  end
end
