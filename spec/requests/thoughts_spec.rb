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

    describe 'GET /thoughts/:id' do
        it 'returns the data of the thought' do
            thought = Thought.new(:text => 'I am hungry')
            thought.save()

            get("/thoughts/#{thought.id}")
            json = JSON.parse(response.body)
            expect(json['data']['text']).to eql('I am hungry');
        end

        it 'returns an error when the thought does not exist' do
            get("/thoughts/1")
            json = JSON.parse(response.body)
            expect(json['error']).to eql('Thought does not exist');
        end
    end
end
