class CreateEventCreations < ActiveRecord::Migration[6.1]
  def change
    create_table :event_creations do |t|
      t.references :creation, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
