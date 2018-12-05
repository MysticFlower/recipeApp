class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.belongs_to :category, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
