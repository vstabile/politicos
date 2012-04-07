class CreateOrgaos < ActiveRecord::Migration
  def change
    create_table :orgaos do |t|
      t.string :sigla
      t.text :descricao

      t.timestamps
    end
  end
end
