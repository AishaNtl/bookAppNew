class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :publishing_year
      t.text :description

      t.timestamps
    end
  end
end
