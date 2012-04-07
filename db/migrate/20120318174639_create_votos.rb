class CreateVotos < ActiveRecord::Migration
  def change
    create_table :votos do |t|
      t.references :votacao
      t.string :voto

      t.timestamps
    end
    add_index :votos, :votacao_id
  end
end
