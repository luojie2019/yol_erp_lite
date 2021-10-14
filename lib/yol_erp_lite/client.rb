require "monitor"
require "redis"
require 'digest/md5'
module YolErpLite 
  class Client

    include Connection::Base
    include Connection::Customer
    include Connection::Material
    include Connection::Bom
    include Connection::BomChild
    
    attr_accessor :host, :corpsecret, :redis

    def initialize(options = {})
      @host = options[:host] || YolErpLite.configuration.host
      @corpsecret = options[:corpsecret] || YolErpLite.configuration.corpsecret
      @redis = options[:redis] || YolErpLite.configuration.redis
    end
  end
end