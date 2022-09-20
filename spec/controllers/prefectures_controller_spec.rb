require 'rails_helper'

RSpec.describe 'Prefectures', type: :request do
  describe 'action test' do
    let!(:prefecture) { FactoryBot.create(:prefecture) }

    context 'GET /show' do
      it 'should return 200' do
        get prefecture_path prefecture.id
        expect(response).to have_http_status(200)
      end
    end

    context 'GET /api/prefectures/id/cities' do
      let(:city) { FactoryBot.create(:city, prefecture_id: prefecture.id) }

      it 'should return 200' do
        get prefecture_path prefecture.id

        expect(response).to have_http_status(200)
      end
    end
  end
end
