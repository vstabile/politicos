# encoding: UTF-8

namespace :scrape do

  task :images => :environment do
		require 'nokogiri'
		require 'open-uri'
		
		url = "http://www.camara.gov.br/internet/deputado/Dep_Lista_foto.asp?Legislatura=54&Partido=QQ&SX=QQ&Todos=None&UF=QQ&condic=QQ&forma=lista&nome=&ordem=nome&origem="
		doc = Nokogiri::HTML(open(url).read)
		
		doc.css(".cor td").each do |deputado|
			email_element = deputado.at_css("a:nth-child(13) font")
			email = email_element.text unless email_element.blank?
			foto_element = deputado.at_css("img")
			foto  = URI.escape(foto_element[:src]) unless foto_element.blank?
			
			if email && foto
				puts "#{email} - #{foto}" 
				
				filename = email.match(/(?<=\.)(.+)(?=@)/)[0]
				
				open("app/assets/images/deputados/#{filename}.jpg", 'wb') do |file|
					file << open(foto).read
				end
			end
		end

  end
end
