require_relative 'form_request'

class RetrieveFormRequest < FormRequest
  def initialize(token, form)
    r = {
      method: :get,
      url: "#{APIConfig.api_request_url}/forms/#{form.id}",
    }
    r[:headers] = { 'Authorization' => "Bearer #{user.jwt}" } unless user.nil?

    request(r)
  end

  def success?
    @response.code == 200 && json?
  end
end
