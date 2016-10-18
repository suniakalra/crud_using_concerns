module CRUD
  extend ActiveSupport::Concern

  def new
    set_instance_variable("@#{resource_class.downcase}", resource_class.constantize.new)
  end

  def create
    resource = resource_class.constantize.new(@permitted_resource_params)
    if resource.save
      redirect_to resource
    else
      render :new
    end
  end

  def show
    set_instance_variable("@#{resource_class.downcase}", set_record)
  end

  def index
    set_instance_variable("@#{resource_class.downcase}s", resource_class.constantize.all)
  end

  def edit
    set_instance_variable("@#{resource_class.downcase}", set_record)
  end

  def update
    @record = set_record
    respond_to do |format|
      if @record.update(@permitted_resource_params)
        format.html { redirect_to @record, notice: 'Successfully updated.' }
        format.json { render :show, status: :ok, location: @record }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    set_record.destroy
    respond_to do |format|
      format.html { redirect_to index_path, notice: 'Successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_record
      resource_class.constantize.find(params[:id])
    end

    def resource_class
      params[:controller].singularize.capitalize
    end

    def index_path
      '/#{params[:controller]}'
    end

    def set_instance_variable(var_name, value)
     instance_variable_set var_name, value
    end
end