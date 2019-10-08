require 'rails_helper'

RSpec.describe 'Thoughts requests' do
    describe 'GET /thoughts' do
        it 'returns a json response' do
            get('/thoughts')
            json = JSON.parse(response.body)
            expect(json['data']).to eql([])
            expect(response.status).to eql(200)
        end

        it 'returns a list of thoughts' do
            thought = Thought.new(:text => 'I am hungry')
            thought.save()
            thought = Thought.new(:text => 'I am happy')
            thought.save()

            get('/thoughts')
            json = JSON.parse(response.body)
            expect(json['data'][0]['text']).to eql('I am hungry');
            expect(json['data'][1]['text']).to eql('I am happy');
        end
    end
end
