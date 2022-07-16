class AddPostImagesCountToPosts < ActiveRecord::Migration[7.0]
  def self.up
    add_column :posts, :post_images_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :posts, :post_images_count
  end
end
