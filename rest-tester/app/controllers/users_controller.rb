class UsersController < ApplicationController
  def index
    @name = 'I am the index action.'
  end

  def new
    @name = 'I am the new action.'
  end

  def edit
    @name = 'I am the edit action.'
  end

  def show
    @name = 'I am the show action.'
  end

  def create

  end

end
