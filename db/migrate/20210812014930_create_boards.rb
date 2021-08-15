class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :title
      t.string :image_id
      t.text :introduction
      t.boolean :is_finish, default:false, null:false
      t.integer :customer_id
      t.timestamps
    end
  end
end
