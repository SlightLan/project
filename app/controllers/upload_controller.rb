class UploadController < ApplicationController
	def index
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
