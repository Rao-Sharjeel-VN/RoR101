class AddPasswordDigestToChefs < ActiveRecord::Migration[7.0]
  def change
    add_column :chefs, :password_digests, :string

  end
end
