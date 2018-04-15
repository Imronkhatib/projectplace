class AddAdminIdToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :admin_id, :integer
  end
end
