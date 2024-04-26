# frozen_string_literal: true

RSpec.shared_context 'client' do
  let(:client) do
    UnifiedLms::Client.create_client(
      :canvas,
      redirect_uri: "https://example.com/",
      client_id: "example_id",
      client_secret: "example_secret",
      token: 'token'
    )
  end
end

RSpec.shared_context 'login' do
  include_context 'client'
  before {
    stub_request(:get, "https://canvas.instructure.com/login/oauth2/auth?client_id=example_id&redirect_uri=https://example.com/&response_type=code").
      with(
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Unified_LMS/0.1.0 (ruby3.2.2)'
        }).
      to_return(status: 200, body: "", headers: {})

    stub_request(:post, "https://canvas.instructure.com/login/oauth2/token").
      with(
        body: {"client_secret"=>"client_secret", "code"=>"code", "grant_type"=>"grant_type"})
      .to_return(status: 200, body: { access_token: 'bca8d83e-7d37-4670-81b6-560ac452773e' }.to_json, headers: { 'Content-Type' => 'application/json' })

    client.authenticate
  }
end