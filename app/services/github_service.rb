class GithubService
  def initialize(user)
    @user = user
  end
  
  def repositories_by_user
    params = {username: @user.token}
    response = conn.get("user/repos", params)
    
    JSON.parse(response.body, symbolize_names: true)
  end
  
  private
  
  def conn
    Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end