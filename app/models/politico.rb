class Politico < ActiveRecord::Base
	belongs_to :partido
	has_many :memberships
	has_many :orgaos, :through => :memberships
	has_many :votos

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  def self.obterDeputados
		client = ::Savon::Client.new("http://www.camara.gov.br/sitcamaraws/deputados.asmx?wsdl")
		response = client.request :obter_deputados
		response_hash = response.to_hash
		return response_hash[:obter_deputados_response][:obter_deputados_result][:deputados][:deputado]
  end
  
  
  def foto
		"deputados/#{email.match(/(?<=\.)(.+)(?=@)/)[0]}.jpg" if self[:foto].blank?
  end
  
  private
  
  def password_required?
		new_record? ? false : super
  end
end
