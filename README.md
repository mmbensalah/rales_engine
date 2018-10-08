# README

Purpose: 

This is my first project building out a basic API. The API accesses data imported from CSVs stored in a postgresql database.

How to use: 

1. From this project's root directory - run "bundle"
2. Execute "rake db:{create,migrate}" 
3. Execute "rake import:data"
4. Execute "rails s" to launch the project to localhost:3000
	 Now you will have access to the API URLs. 
	 For example, "localhost:3000/api/v1/customers" will return all the customers in our database


