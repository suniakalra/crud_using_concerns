class ArticlesController < ApplicationController
  include CRUD
  before_action :permitted_resource_params, only: [:create, :update]

  private
    def permitted_resource_params
      @permitted_resource_params = params.require(:article).permit(:title, :text)
    end
end
