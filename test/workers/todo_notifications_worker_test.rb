# frozen_string_literal: true

require "test_helper"
require "support/sidekiq_helper"

class TodoNotificationsWorkerTest < ActiveSupport::TestCase
  include SidekiqHelper
  def setup
    @user = create(:task).assigned_user # assignee of the generated task
    default_mail_delivery_time = "#{Constants::DEFAULT_NOTIFICATION_DELIVERY_HOUR}:00 AM"
    travel_to DateTime.parse(default_mail_delivery_time)
  end
end
