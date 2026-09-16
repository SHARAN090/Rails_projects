class Subtask < ApplicationRecord
  belongs_to :task

  validates :name, presence: true
  validates :description, presence: true

  def self.create_subtask(task, name, description)
    task.subtasks.create(
      name: name,
      description: description
    )
  end

  def self.view_subtasks(task)
    task.subtasks
  end

  def update_subtask(name, description)
    update(
      name: name,
      description: description
    )
  end

  def delete_subtask
    destroy
  end
end
