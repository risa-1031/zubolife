class CreateContents < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.text :text
      t.text :image
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end

    
  end
end
