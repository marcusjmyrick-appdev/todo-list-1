class AddStatusToTodoitems < ActiveRecord::Migration[6.0]
  def change
    add_column :todoitems, :status, :string, default: 'Next Up'
  end
end
