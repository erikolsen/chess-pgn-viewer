class User < ActiveRecord::Base
	has_many :favorites

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.email = auth['info']['email']
      user.name = auth['info']['name']
      user.uid = auth['uid']
    end
  end
end
