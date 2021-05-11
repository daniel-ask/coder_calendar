class CreatePresentationEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :presentation_entries do |t|
      t.string :name
      t.references :presentation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
