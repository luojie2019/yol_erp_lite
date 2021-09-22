module YolErpLite
  class Configuration

    OPTIONS = [:host, :corpsecret, :redis].freeze

    attr_accessor :host

    attr_accessor :corpsecret

    attr_accessor :redis

  end
end
