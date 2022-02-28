class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.string :location
      t.date :date
      t.text :description
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
