class AddEventToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_reference :notifications, :event, foreign_key: true
  end
end
