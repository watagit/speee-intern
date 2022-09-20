RSpec.describe 'AssessmentForms', type: :request do
  describe 'GET /new' do
    it 'リクエストに成功する' do
      get new_assessment_form_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /new' do
    it 'リクエストに成功' do; end
    it 'リクエストに失敗' do; end
  end
end
