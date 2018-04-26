class AddPRojectUserStatus < ActiveRecord::Migration[5.1]
  def change
    add_column :project_users, :status, :string, :default => "pending"
  end
end
