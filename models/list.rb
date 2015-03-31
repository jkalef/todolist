require "data_mapper"
DataMapper.setup(:default, "sqlite://#{Dir.pwd}/data.db")

#create my list class
class List

	#need to include some data_mapper modules
	include DataMapper::Resource
	
	#the list needs to have an ID, task, and Complete/Incoomplete (status)
	property :id, Serial
	property :task, Text
	property :status, String


end

DataMapper.finalize

List.auto_upgrade!