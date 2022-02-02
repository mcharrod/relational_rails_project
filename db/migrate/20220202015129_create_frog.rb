class CreateFrog < ActiveRecord::Migration[5.2]
  def change
    create_table :frogs do |t|
      t.string :name
      t.integer :age
      t.boolean :singing
      t.references :bog, foreign_key: true
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
