class UsersController < ApplicationController

  def index
    render json: {id: 1, username: "string", email: "string@string.com"}
  end

end
