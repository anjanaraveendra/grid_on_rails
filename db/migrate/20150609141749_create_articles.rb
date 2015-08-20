class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.integer :edition_number

      t.timestamps
    end
  end
end
