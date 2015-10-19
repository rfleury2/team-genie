class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
    	t.belongs_to :membership
    	t.belongs_to :game
    	t.string :response, default: "pending"
    	t.text :comment

      t.timestamps null: false
    end
  end
end
