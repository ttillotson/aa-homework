class UpdatePasswordDigestNull < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :password_digest
    add_column :users, :password_digest, :string
  end
end
