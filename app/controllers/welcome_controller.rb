class WelcomeController < ApplicationController

	def trigger_realtime_message
		@test = {msg: 'hello world - ' + SecureRandom.hex, recipient_user_ids: [41, 42]}.to_json
		$redis.publish 'realtime_msg', @test
		respond_to do |format|
		  format.json {render json: @test }
		end
	end

	def server
		@user_id = params[:user_id]
	end

	def client
		@user_id = params[:user_id]
	end

	def three

	end

end
