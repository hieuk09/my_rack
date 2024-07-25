# frozen_string_literal: true

require 'http'

RSpec.describe MyRack do
  describe 'GET /hello' do
    it 'renders successful' do
      response = HTTP.get('http://localhost:9292/hello')

      expect(response.status).to eq(200)
      expect(response.body.to_s).to eq('Hello, World!')
    end
  end

  describe 'GET /goodbye' do
    it 'renders 404' do
      response = HTTP.get('http://localhost:9292/goodbye')

      expect(response.status).to eq(404)
      expect(response.body.to_s).to eq('Not Found')
    end
  end
end
