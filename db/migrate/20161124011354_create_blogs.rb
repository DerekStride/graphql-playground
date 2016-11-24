class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :content
      t.references :author

      t.timestamps
    end
  end
end
