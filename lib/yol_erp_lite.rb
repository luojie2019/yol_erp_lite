require 'roxml'
require 'multi_xml'
require 'ostruct'
require 'net/http'
require 'jwt'
require 'json'

require "yol_erp_lite/version"

require "yol_erp_lite/models/configuration"
require "yol_erp_lite/models/encrypt_message"
require "yol_erp_lite/helpers/prpcrypt"

require "yol_erp_lite/connection"
require "yol_erp_lite/client"

module YolErpLite

  class << self

    # A Sso configuration object. See Sso::Configuration.
    attr_writer :configuration

    def configure
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end

  end
end
