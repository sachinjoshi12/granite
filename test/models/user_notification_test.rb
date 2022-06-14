# frozen_string_literal: true

require "test_helper"
class UserNotificationsWorkerTest < ActiveSupport::TestCase
  def setup
    @user = create(:user)
  end
end
