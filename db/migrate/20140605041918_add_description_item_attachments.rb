class AddDescriptionItemAttachments < ActiveRecord::Migration
  def self.up
    add_column :projects, :avatar_piece_file_name, :string, :after => :user_id
    add_column :projects, :avatar_piece_content_type, :string, :after => :avatar_piece_file_name
    add_column :projects, :avatar_piece_file_size, :integer, :after => :avatar_piece_content_type
    add_column :projects, :avatar_piece_updated_at, :datetime, :after => :avatar_piece_file_size
  end

  def self.down
    remove_column :projects, :avatar_piece_file_name
    remove_column :projects, :avatar_piece_content_type
    remove_column :projects, :avatar_piece_file_size
    remove_column :projects, :avatar_piece_updated_at
  end
end
