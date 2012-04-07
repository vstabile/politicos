class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :politico
      t.references :orgao
      t.string :cargo

      t.timestamps
    end
    add_index :memberships, :politico_id
    add_index :memberships, :orgao_id
  end
end
