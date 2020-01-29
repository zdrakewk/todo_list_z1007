class TodosController < ApplicationController
  # index route, list all todos frm th todos table
  get '/todos' do
    # list all todos from db
    @todos = Todo.all

    # testing data
    # @todos = [{content: 'test 1', completed: 'false'}, {content: 'test 2', completed: false}]

    erb :'todos/index'
  end

  # new route, display a form to create a NEW todo obj
  get '/todos/new' do
    erb :'todos/new'
  end

  # create route, make a new Todo obj from form/user input
  post '/todos' do
    # make a new todo obj 
    # new_todo_obj = Todo.new(params)
    new_todo_obj = Todo.new(
      content: params[:content], 
      complete: params[:complete]
    )
    # store that obj in table
    new_todo_obj.save

    # redirct the use to view new obj
    redirect "/todos/#{new_todo_obj.id}"
  end

  # show route, display one objs
  get '/todos/:id' do
    @todo = Todo.find_by_id(params[:id])
    erb :'todos/show'
  end 

  # edit route, display a form to create a edit todo obj
  get '/todos/:id/edit' do
    @todo = Todo.find_by_id(params[:id])
    erb :'todos/edit'
  end
  
  # update route, updated the obj info from form data 
  post '/todos/:id' do
    updated_todo = Todo.find_by_id(params[:id])
    updated_todo.update(params)
    # updated_todo.update(
    #   content: params[:content],
    #   complete: params[:complete]
    # )

    # updated_todo.content = params[:content]
    # updated_todo.complete = params[:complete]
    # updated_todo.save

    redirect "/todos/#{updated_todo.id}"
  end  
  
  delete '/todos/:id/delete' do
    @deleteTodo = Todo.find_by_id(params[:id])
    @deleteTodo.delete
    redirect '/todos'
  end
end