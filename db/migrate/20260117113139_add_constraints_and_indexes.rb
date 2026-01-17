class AddConstraintsAndIndexes < ActiveRecord::Migration[8.0]
  def change
    # Add NOT NULL constraints to contact_inquiries
    change_column_null :contact_inquiries, :name, false
    change_column_null :contact_inquiries, :email, false
    change_column_null :contact_inquiries, :message, false
    change_column_default :contact_inquiries, :read, from: nil, to: false

    # Add NOT NULL constraints to projects
    change_column_null :projects, :title, false
    change_column_default :projects, :published, from: nil, to: false

    # Add NOT NULL constraints to artworks
    change_column_null :artworks, :title, false

    # Add NOT NULL constraints to artists
    change_column_null :artists, :name, false

    # Add indexes for commonly queried columns
    add_index :contact_inquiries, :read
    add_index :contact_inquiries, :created_at
    add_index :projects, :published
    add_index :projects, :position
    add_index :artworks, :position
  end
end
