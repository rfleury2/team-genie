class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
    	t.belongs_to :team
    	t.belongs_to :player
    	t.float	:amount_owed, default: 0
    	t.boolean	:paid, default: false

      t.timestamps null: false
    end
  end
end
