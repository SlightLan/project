class UploadController < ApplicationController
	def index
		request = Typhoeus::Request.new(
			"http://120.27.22.10/api/v4/projects",
			method: :get,
			params: {
					  private_token: "1AgYdoJ8Faf2Z6ExXX1i",
					  simple: "true"
					}
		)
		request.run
		response = request.response
		@projectsInfo = JSON.parse(response.body)
		@projectsName = Array.new
		@projectsInfo.each do |projectInfo|
			oneProjectSet = Array.new
			oneProjectSet.push(projectInfo["name"])
			oneProjectSet.push(projectInfo["id"])
			@projectsName.push(oneProjectSet)
		end
		logger.debug(@projectsName)   # This array save user's projects'name with id
		#store project's branches
		#@projectsFileTree = Array.new
		#@projectsId.each do |id|
		#	request = Typhoeus::Request.new(
		#		"http://120.27.22.10/api/v4/projects/#{id}/repository/tree",
		#		method: :get,
		#		params: {
		#				  private_token: "1AgYdoJ8Faf2Z6ExXX1i",
		#				  #recursive: "true"
		#				}
		#	)
		#	request.run
		#	response = request.response
		#	@projectsFileTree.push(JSON.parse(response.body))
		#	#logger.debug(response.body)
		#end

		#@projectFileTree = Array.new
		#@projectsFileTree.each do |t|
		#	logger.debug(t)
		#	tt = Hash.new
		#	tt = JSON.parse(t)
		#	singleProject = Array.new
		#	tt.each do |ttt|
		#		singleProject.push(JSON.parse(tt))
		#	end
		#	@projectFileTree.push(singleProject)
		#end
		#logger.debug(@projectFileTree)


	end
	
	def uploadFile
		logger.debug("File:")
		@theUploadFile = params[:uploadFile]
		logger.debug(params[:uploadFile])
		logger.debug(@theUploadFile["fileTitle"])
		logger.debug(params[:fileContent])
	end

	def showProjectFiles
		logger.debug("To show your Files +++++++++++++++++++")
	end


end
