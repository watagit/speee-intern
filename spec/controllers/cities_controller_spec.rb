require 'rails_helper'

RSpec.describe 'Cities', type: :request do
  describe 'action test' do
    let!(:prefecture) { FactoryBot.create(:prefecture) }
    let!(:city) { FactoryBot.create(
      :city,
      prefecture_id: Prefecture.first.id
    )}

    context 'GET /show' do
      context 'when city id is found' do
        it 'cities/:id アクセス時 id が存在する場合 http status code 200 が返ってくる' do
          get city_path city.id
          expect(response).to have_http_status(200)
        end
      end
    end
  end
end
