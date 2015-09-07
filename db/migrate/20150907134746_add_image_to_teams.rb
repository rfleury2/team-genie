class AddImageToTeams < ActiveRecord::Migration
  def up
    add_attachment :teams, :avatar
  end

  def down
    remove_attachment :teams, :avatar
  end
end
