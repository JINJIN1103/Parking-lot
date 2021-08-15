class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string "title_l"
      t.integer "customer_id"
      t.integer "board_id"
      t.boolean :is_finish_, default:false, null:false
      t.timestamps
    end
  end
end
