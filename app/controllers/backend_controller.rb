class BackendController < ApplicationController
  layout 'admin'
  before_action :id?, :only => [:delete, :edit, :update, :destroy]
  before_action :logged_in?
end
