class CreateMyalbums < ActiveRecord::Migration[5.1]
  def change
    create_table :myalbums do |t|
      t.string :name
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
