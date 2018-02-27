class HomeController < ApplicationController
	before_action :authenticate_user!
	def index
		request = Typhoeus::Request.new(
			"http://120.27.22.10/api/v4/session",
			method: :post,
			params: {
					  login: "lan",
					  password: "secret95"
					}
		)
		request.run
		response = request.response
		userToken = JSON.parse(response.body)
		logger.debug(current_user.email)
		logger.debug(userToken["private_token"])
		redirect_to :controller => 'upload', :action => 'index'
	end


end
