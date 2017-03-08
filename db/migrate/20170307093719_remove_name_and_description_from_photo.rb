class RemoveNameAndDescriptionFromPhoto < ActiveRecord::Migration[5.0]
  def change
    remove_column :photos, :name,        :string
    remove_column :photos, :description, :text
  end
end
