class CreatePartidos < ActiveRecord::Migration
  def change
    create_table :partidos do |t|
      t.string :nome
      t.string :sigla
      t.string :numero_eleitora
      t.string :deferimento
      t.string :presidente

      t.timestamps
    end
  end
end
