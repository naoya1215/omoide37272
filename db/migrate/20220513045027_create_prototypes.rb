class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string  :title,          null: false
      t.integer :prefecture_id,  null: false
      t.timestamps
    end
  end
end
