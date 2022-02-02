class CreateBog < ActiveRecord::Migration[5.2]
  def change
    create_table :bogs do |t|
      t.string :name
      t.float :ph
      t.boolean :radioactive
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
