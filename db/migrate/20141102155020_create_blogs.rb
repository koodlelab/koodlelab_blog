class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs, id: false do |t|
      t.string :title
      t.string :body

      t.timestamps null: false
    end
    add_index :blogs, :title, unique: true
  end
end
