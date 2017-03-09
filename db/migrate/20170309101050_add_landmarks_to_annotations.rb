class AddLandmarksToAnnotations < ActiveRecord::Migration[5.0]
  def change
    add_column :annotations, :landmarks, :string, array: true, default: []
  end
end
