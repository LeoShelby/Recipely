class AddBadgeToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_reference :notifications, :badge, foreign_key: true
  end
end
