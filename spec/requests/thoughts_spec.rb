require 'rails_helper'

RSpec.describe 'Thoughts requests' do
    describe 'GET /thoughts' do
        it 'returns a json response' do
            get('/thoughts')
            json = JSON.parse(response.body)
            expect(json['data']).to eql([])
        end
    end
end
