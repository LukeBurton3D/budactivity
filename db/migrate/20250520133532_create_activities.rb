class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.string :image_url
      t.text :description
      t.string :category
      t.string :location

      t.timestamps
    end
  end
end
