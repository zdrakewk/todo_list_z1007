class TodosController < ApplicationController
  get '/todos' do
    # list all todos from db
    @todos = [{content: 'test 1', completed: 'false'}, {content: 'test 2', completed: false}]

    erb :'todos/index'
  end
end