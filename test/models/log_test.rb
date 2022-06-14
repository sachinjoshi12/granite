# frozen_string_literal: true

class LogTest < ActiveJob::TestCase
  def setup
    @task = create(:task)
  end

  test "log count increments on running task logger" do
    Sidekiq::Testing.inline!
    assert_difference "Log.count", 1 do
      TaskLoggerJob.new.perform(@task)
    end
  end
end
