class ChangeTodosNameLimit30 < ActiveRecord::Migration[5.2]
  def up
    change_column :todos, :name, :string, limit: 30
  end
  def down
    change_column :todos, :name, :string
  end
end
