class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
    	t.belongs_to	:team
    	t.belongs_to	:inviter
    	t.string			:email

      t.timestamps null: false
    end
  end
end
