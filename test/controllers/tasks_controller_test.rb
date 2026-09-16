require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "creates a task from the new task form" do
    assert_difference("Task.count", 1) do
      post tasks_path, params: {
        task: {
          name: "Prepare report",
          description: "Finish the monthly report",
          due_date: "2026-09-20",
          category: "Work",
          priority: "High"
        }
      }
    end

    assert_redirected_to tasks_path
    assert_equal "Prepare report", Task.order(:created_at).last.name
  end
end
