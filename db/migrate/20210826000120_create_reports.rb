class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
    t.string "title_r"
    t.string "image_id"
    t.text "introduction_r"
    t.integer :customer_id
    t.integer :category_id
      t.timestamps
    end
  end
end
