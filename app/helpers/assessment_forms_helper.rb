module AssessmentFormsHelper
  def post_assessment(params)
    uri = URI.parse('https://miniul-api.herokuapp.com//affiliate/v2/conversions')
    response = Net::HTTP.post(uri, params)
  end
end
