require "sinatra"
require "data_mapper"
require "./models/list.rb"

#to be able to change from incomplete to complete, need to be
#able to PATCH the data
use Rack::MethodOverride


get '/' do 
	@task_list_todo = List.all(:status => "1")
	@task_list_completed = List.all(:status => "2")
	erb :index, layout: :application	
end


post '/' do
	params[:status] = 1

#create the table from params
#going to keep the status set to empty..i.e., not going
#to collect status at all initially from the first form
	List.create(task: params[:task], status: params[:status]) 
	redirect to('/')
end


#need to build the PATCH action to PATCH the status
#of the tasks
patch '/:id' do |id|
	current_task = List.get(id)
	#select the task from the params
	current_task.status = params[:status]
	current_task.save 
	redirect to('/')
end



