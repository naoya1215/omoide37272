class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string  :title
      t.integer :prefecture_id
      t.text    :image
      t.timestamps
    end
  end
end
