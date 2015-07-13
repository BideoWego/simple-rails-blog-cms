module ApplicationHelper
	def dump(*args)
		output = '<pre style="background: #ffeef; color: #000; border: 1px dotted #fa0; padding: 10px; margin: 10px; text-align: left; white-space: normal;">'
		args.each do |i|
			output += i.inspect
		end
		output += '</pre>'
		output.html_safe
	end

	def error_messages_for(object)
		render :partial => 'shared/error_messages', :locals => {:object => object}
	end
end