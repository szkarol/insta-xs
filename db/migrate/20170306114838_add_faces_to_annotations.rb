class AddFacesToAnnotations < ActiveRecord::Migration[5.0]
  def change
    add_column :annotations, :faces, :text, array: true, default: []
  end
end
