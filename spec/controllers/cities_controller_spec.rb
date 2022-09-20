require 'rails_helper'

RSpec.describe 'Cities', type: :request do
  describe 'action test' do
    let(:city) { FactoryBot.create(:city) }

    context 'GET /city/:id' do
      context 'when city id is found' do
        it 'cities/:id アクセス時 id が存在する場合 http status code 200 が返ってくる' do
          get city_path city.id
          expect(response).to have_http_status(200)
        end
      end
    end
  end
end
