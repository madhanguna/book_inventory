class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
    	t.string :title
        t.float :price
        t.string :isbn
        t.boolean :available
        t.references :publisher,index: true ,null: false,foreign_key: true
        t.references :author,index: true ,null: false,foreign_key: true

        t.timestamps null: false
    end
  end
end
