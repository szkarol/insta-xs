class AddLogosToAnnotations < ActiveRecord::Migration[5.0]
  def change
    add_column :annotations, :logos, :string, array: true, default: []
  end
end
