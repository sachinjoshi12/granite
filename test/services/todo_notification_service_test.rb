# frozen_string_literal: true

require "test_helper"
require "support/sidekiq_helper"
class TodoNotificationServiceTest < ActiveSupport::TestCase
  include SidekiqHelper

  def setup
    @sam = create(:task).assigned_user # assignee of the generated task
    @nancy = create(:task).assigned_user # assignee of another generated task

    default_mail_delivery_time = "#{Constants::DEFAULT_NOTIFICATION_DELIVERY_HOUR}:00 AM"
    travel_to DateTime.parse(default_mail_delivery_time)
  end

  private

    def todo_notification_service
      TodoNotificationService.new
    end
end
