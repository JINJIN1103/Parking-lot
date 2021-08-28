class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
    t.string "title_d"
    t.string "profile_image_id"
    t.text "introduction_d"
    t.integer :customer_id
      t.timestamps
    end
  end
end
