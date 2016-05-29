class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.belongs_to :tag
      t.integer :taggable_id
      t.string :taggable_type

      t.timestamps null: false
    end

    add_index :taggings, :tag_id
    add_index :taggings, [:taggable_id, :taggable_type]
  end
end
