class AddJoinTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :categories, :post_id
    create_table :categories_posts, id: false do |t|
      t.integer :category_id
      t.integer :post_id 
    end
  end
end
