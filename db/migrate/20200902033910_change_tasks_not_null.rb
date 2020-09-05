class ChangeTasksNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tasks, :name, :string, null: false
    change_column_null :tasks, :description, :text, null: false
  end
end
