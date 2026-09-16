class Task < ApplicationRecord
    has_many :subtasks, dependent: :destroy


    validates :name, presence: true
    validates :description, presence: true
    validates :due_date, presence: true
    validates :category, presence: true
    validates :priority, presence: true

    def self.create_task(name, description, due_date, category, priority)
        create(
            name: name,
            description: description,
            due_date: due_date,
            category: category,
            priority: priority
        )
    end

    def self.view_tasks
        all
    end

    def self.search_task(keyword)
        where(
            "name LIKE ? OR description LIKE ? OR category LIKE ?",
            "%#{keyword}%",
            "%#{keyword}%",
            "%#{keyword}%"
        )
    end

    def update_task(name, description, due_date, category, priority)
        update(
            name: name,
            description: description,
            due_date: due_date,
            category: category,
            priority: priority
        )
    end
    
    def delete_task
        destroy
    end
end
