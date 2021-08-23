class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string "title_t"
      t.string "introduction_t"
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :is_finish_t, default:false, null:false
      t.integer "customer_id"
      t.integer "board_id"
      t.integer "list_id"

      t.timestamps
    end
  end
end
