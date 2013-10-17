class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
			t.integer :user_id, null: false
			t.integer :sub_id, null: false
			t.string :title, null: false
			t.string :body
			t.string :url, null: false

      t.timestamps
    end
		add_index(:links, :user_id)
		add_index(:links, :sub_id)
  end
end
