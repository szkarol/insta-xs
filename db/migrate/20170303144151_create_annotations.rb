class CreateAnnotations < ActiveRecord::Migration[5.0]
  def change
    create_table :annotations do |t|
      t.references :photo, null: false
      t.text       :labels, array: true, default: []
    end
  end
end
