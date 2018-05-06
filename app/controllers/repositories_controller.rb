class RepositoriesController < ApplicationController
  def index
  end

  def create
    response = Faraday.post "https://api.github.com/user/repos" do |req|
      req.params['name'] = params[:name]
      req.params['Authorization'] = "token #{session[:token]}"
      req.params['Accept'] => 'application/json'
    end
    redirect_to '/'
  end
end
