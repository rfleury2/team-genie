class AddRoleToMemberships < ActiveRecord::Migration
  def change
  	add_column :memberships, :role, :string, default: "player"
  end
end
