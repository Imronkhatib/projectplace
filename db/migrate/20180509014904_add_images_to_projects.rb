class AddImagesToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :image, :string
  end
end
