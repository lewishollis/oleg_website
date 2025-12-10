class CreateArtworks < ActiveRecord::Migration[8.0]
  def change
    create_table :artworks do |t|
      t.string :title
      t.text :description
      t.integer :year
      t.string :dimensions
      t.string :medium
      t.integer :position
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
