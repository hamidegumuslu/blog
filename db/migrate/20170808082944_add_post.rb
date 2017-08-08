class AddPost < ActiveRecord::Migration[5.1]

  def change
    create_table :posts do |f|
      f.string :title
      f.text :body
    end
  end

end
