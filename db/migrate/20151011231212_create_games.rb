class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    	t.belongs_to :team
    	t.datetime :time

      t.timestamps null: false
    end
  end
end
