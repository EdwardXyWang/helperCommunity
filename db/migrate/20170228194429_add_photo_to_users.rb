class AddPhotoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :photo, :attachment
  end
end
