module IControlF5
  class Connection
    attr_accessor :endpoint
    def initialize(host, opts = {})
      opts = {:endpoint => "https://#{host}/iControl/iControlPortal.cgi",
        :verify_mode => OpenSSL::SSL::VERIFY_NONE
      }.merge opts

      @basic_auth = []
      @basic_auth << opts[:endpoint]
      @basic_auth << opts[:user]
      @basic_auth << opts[:password]
      @endpoint = opts[:endpoint]
      @verify_mode = opts[:verify_mode]
    end

    def load_wsdl_driver(name)
      wsdl = File.join WSDL_PATH, "#{ name }.wsdl"
      driver = SOAP::WSDLDriverFactory.new(wsdl).create_rpc_driver
      driver.options['protocol.http.ssl_config.verify_mode']= @verify_mode
      driver.options['protocol.http.basic_auth'] << @basic_auth
      driver.endpoint_url = @endpoint
      driver
    end

    def method_missing(id, *args)
      wsdl_name = "LocalLB.#{id.to_s.camelize }"
      puts wsdl_name
      if File.exists?(File.join(WSDL_PATH, wsdl_name) + ".wsdl")
        load_wsdl_driver(wsdl_name)
      else
        raise NoMethodError
      end
    end

  end
end
