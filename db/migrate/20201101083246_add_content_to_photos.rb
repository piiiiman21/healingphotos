class AddContentToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :content, :string
  end
end
