# frozen_string_literal: true

require "test_helper"

class TaskMailerTest < ActionMailer::TestCase
  def setup
    @user = create(:user)
  end

  def test_task_mailer_shouldnt_deliver_email_if_receiver_is_not_present
    email = TaskMailer.pending_tasks_email("").deliver_now
    assert ActionMailer::Base.deliveries.empty?
    assert_nil email
  end
end
