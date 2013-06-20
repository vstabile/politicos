# encoding: UTF-8

namespace :db do
  desc "Popula banco de dados com informacoes sobre deputados"
  task :obterDeputados => :environment do
		
		[Politico, Partido, Orgao, Membership].each do |c|
			c.unscoped.delete_all
			ActiveRecord::Base.connection.reset_pk_sequence!(c.table_name)
    end
    
		#client = ::Savon::Client.new("http://www.camara.gov.br/sitcamaraws/deputados.asmx?wsdl")
		client = Savon.client(wsdl: "http://www.camara.gov.br/sitcamaraws/deputados.asmx?wsdl")
		#response = client.request :obter_deputados
		response = client.call(:obter_deputados)
		response_hash = response.to_hash
		deputados =  response_hash[:obter_deputados_response][:obter_deputados_result][:deputados][:deputado]
		
		deputados.each do |deputado|
		
			partido = Partido.find_or_create_by_sigla(deputado[:partido])
			
			politico = Politico.new
			politico.nome = deputado[:nome]
			politico.nome_parlamentar = deputado[:nome_parlamentar]
			politico.id_parlamentar = deputado[:id_parlamentar]
			politico.sexo = deputado[:sexo]
			politico.uf = deputado[:uf]
			politico.gabinete = deputado[:gabinete]
			politico.anexo = deputado[:anexo]
			politico.fone = deputado[:fone]
			politico.email = deputado[:email]
			politico.partido = partido
			
			comissoes_titular = deputado.try(:[], :comissoes).try(:[], :titular).try(:[], :comissao)
			if comissoes_titular.kind_of? Array
				comissoes_titular.each do |comissao|
					orgao = Orgao.find_or_create_by_sigla(comissao[:@sigla]) { |c| c.nome = comissao[:@nome] }
					membership = Membership.new
					membership.orgao = orgao
					membership.cargo = "titular"
					politico.memberships << membership
				end
			elsif comissoes_titular.kind_of? Hash
				comissao = comissoes_titular
				orgao = Orgao.find_or_create_by_sigla(comissao[:@sigla]) { |c| c.nome = comissao[:@nome] }
				membership = Membership.new
				membership.orgao = orgao
				membership.cargo = "titular"
				politico.memberships << membership
			end
			
			comissoes_suplente = deputado.try(:[], :comissoes).try(:[], :suplente).try(:[], :comissao)
			if comissoes_suplente.kind_of? Array
				comissoes_suplente.each do |comissao|
					orgao = Orgao.find_or_create_by_sigla(comissao[:@sigla]) { |c| c.nome = comissao[:@nome] }
					membership = Membership.new
					membership.orgao = orgao
					membership.cargo = "suplente"
					politico.memberships << membership
				end
			elsif comissoes_suplente.kind_of? Hash
				comissao = comissoes_suplente
				orgao = Orgao.find_or_create_by_sigla(comissao[:@sigla]) { |c| c.nome = comissao[:@nome] }
				membership = Membership.new
				membership.orgao = orgao
				membership.cargo = "suplente"
				politico.memberships << membership
			end
			
			politico.save
			
		end
  
  end
end
