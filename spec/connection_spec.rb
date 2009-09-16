require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Connection" do
  it "should infer the endpoint from the hostname" do
    conn = IControlF5::Connection.new($spec_config["host"], :user => $spec_config['user'], :password => $spec_config['pass'])
    conn.endpoint.should == "https://#{$spec_config["host"]}/iControl/iControlPortal.cgi"
  end
  it "should load the wsdl" do
    conn = IControlF5::Connection.new($spec_config["host"], :user => $spec_config['user'], :password => $spec_config['pass'])
    conn.load_wsdl_driver("LocalLB.PoolMember").should_not be_nil
  end

  it "should get the member count of a pool" do
    conn = IControlF5::Connection.new($spec_config["host"], :user => $spec_config['user'], :password => $spec_config['pass'])
    pool = conn.pool_member :local
    pool.get_ratio($spec_config['pool']).class.should == Array
  end
end

