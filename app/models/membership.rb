class Membership < ActiveRecord::Base
  belongs_to :politico
  belongs_to :orgao
end
