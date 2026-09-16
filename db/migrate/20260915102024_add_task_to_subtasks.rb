class AddTaskToSubtasks < ActiveRecord::Migration[8.1]
  def change
    add_reference :subtasks, :task, null: false, foreign_key: true
  end
end
