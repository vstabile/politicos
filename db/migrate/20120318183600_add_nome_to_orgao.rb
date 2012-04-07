class AddNomeToOrgao < ActiveRecord::Migration
  def change
    add_column :orgaos, :nome, :text

  end
end
