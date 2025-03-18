class ChangeAcceptedDefaultInBloodRequests < ActiveRecord::Migration[8.0]
  def change
    change_column_default :blood_requests, :accepted, false
  end
end
