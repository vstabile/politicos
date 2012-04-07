class AddFieldsToPolitico < ActiveRecord::Migration
  def change
    add_column :politicos, :id_parlamentar, :string

    add_column :politicos, :nome, :string

    add_column :politicos, :nome_parlamentar, :string

    add_column :politicos, :sexo, :string

    add_column :politicos, :uf, :string

    add_column :politicos, :gabinete, :string

    add_column :politicos, :anexo, :string

    add_column :politicos, :fone, :string

    add_column :politicos, :foto, :string

  end
end
