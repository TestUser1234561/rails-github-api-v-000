class RepositoriesController < ApplicationController
  def index
  end

  def create
    response = Faraday.post "https://api.github.com/user/repos",
                            { name: params[:name] }.to_json,
                            { 'Authorization' => "token #{session[:token]}",
                              'Accept' => 'application/json' }
    redirect_to '/'
  end
end
