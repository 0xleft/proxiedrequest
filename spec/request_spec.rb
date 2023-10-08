require "proxied_request"

RSpec.describe ProxiedRequest do
  it "has a version number" do
    expect(ProxiedRequest::VERSION).to eq("0.0.0")
  end
end