require 'net/http'

module AssessmentFormsHelper
  # 査定依頼情報をイエウールに送信する
  # 通信に成功したらtrueを返す
  def post_assessment(params)
    uri = URI.parse('https://miniul-api.herokuapp.com/affiliate/v2/conversions')
    response = Net::HTTP.post_form(uri, params)

    response.code == '200'
  end
end
