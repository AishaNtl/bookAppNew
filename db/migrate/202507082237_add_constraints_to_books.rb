# db/migrate/[timestamp]_add_constraints_to_books.rb
# class AddConstraintsToBooks < ActiveRecord::Migration[6.1]
# def change
#     change_column :books, :title, :string, limit: 100, null: false
#     change_column :books, :author, :string, limit: 50, null: false
#     change_column :books, :publishing_year, :integer, null: false
#     change_column :books, :description, :string, limit: 1000
#     add_index :books, :title, unique: true
# end
# end

class AddConstraintsToBooks < ActiveRecord::Migration[6.1]
def up
    # Set default publishing_year for existing NULL records
    Book.where(publishing_year: nil).update_all(publishing_year: 2000) # or any default year

    # Now apply constraints
    change_column :books, :title, :string, limit: 100, null: false
    change_column :books, :author, :string, limit: 50, null: false
    change_column :books, :publishing_year, :integer, null: false
    change_column :books, :description, :string, limit: 1000
    add_index :books, :title, unique: true
end

def down
    # Revert changes if needed
    change_column :books, :title, :string, null: true
    change_column :books, :author, :string, null: true
    change_column :books, :publishing_year, :integer, null: true
    change_column :books, :description, :string
    remove_index :books, :title if index_exists?(:books, :title)
end
end
