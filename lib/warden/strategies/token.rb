require "warden"

class Warden::Strategies::Token < ::Warden::Strategies::Base
  VERSION = "0.2.0"

  attr_reader :id, :token

  def initialize(env, scope=nil)
    super

    if request.authorization && request.authorization =~ /^Basic (.*)$/m
      @id, @token = Base64.decode64($1).split(/:/, 2)
    else
      uid = config[:user_id_param] || :user_id
      token = config[:user_token_param] || :token
      @id, @token = params[uid], params[token]
    end
  end

  def valid?
    id && token
  end

  def authenticate!
    user = User.where(id: id).first
    token = user.send(config[:token_name])
    if user && secure_compare(token)
      success!(user)
    else
      fail!("Invalid user id or token")
    end
  end

  # Returns the configuration data for the default user scope.
  def config
    env["warden"].config[:scope_defaults][:user][:config]
  end

  private

  # Taken from [Devise](https://github.com/plataformatec/devise).
  # constant-time comparison algorithm to prevent timing attacks
  def secure_compare(a)
    b = token
    return false if a.blank? || b.blank? || a.bytesize != b.bytesize
    l = a.unpack "C#{a.bytesize}"

    res = 0
    b.each_byte { |byte| res |= byte ^ l.shift  }
    res == 0
  end
end
