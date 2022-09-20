require 'rails_helper'

RSpec.describe 'Prefectures', type: :request do
  describe 'action test' do
    let!(:prefecture) { FactoryBot.create(:prefecture) }

    context 'GET /show' do
      # context 'when prefecture id is not found' do
      #   let(:prefecture_id) { Prefecture.last.id + 1 }

      #   it 'should return 500' do
      #     get prefecture_path prefecture_id
      #     puts response
      #     expect(response).to raise_exception(ActiveRecord::RecordNotFound)
      #   end
      # end

      context 'when prefecture id is found' do
        it 'should return 200' do
          get prefecture_path prefecture.id
          expect(response).to have_http_status(200)
        end
      end
    end
  end
end