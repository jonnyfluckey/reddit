class SubsController < ApplicationController
  #Views = User Interaction (Front end) - logic at minimum
  #Controller/routes = directing traffic
  #Model = All logic for the table/record (SQL)

  #skinny controllers / Fat Models
  # -Controller is CRUD actions, routing only
  # -Sorting should go into the models

  #callbacks
  #before_action
  # after_action
  # skip_before_action
  # skip_after_action

  before_action :find_sub, only: [:show, :update, :edit, :destroy]
  #or
  before_action :find_sub, except: [:index, :new, :create]

  
  
  def index
    #shows all the items in the model
    #index @model_names = Model_name.all
    @subs = Sub.all

  end

  def show
    #show @model_name = Model_name.find(params[:id])
    #shows a specific records
    
  end

  def new
    #new @model_name = Model_name.new 
    #creates a record in memory/ rendering the new form
    @sub = Sub.new
    
  end

  def create
    @sub = Sub.new(sub_params)

    if @sub.save
      redirect_to subs_path
    else
      render :new
    end


  end

  def edit
    #edit @model_name = Model_name.find(params[:id])
    #search records to update, and render the edit form
  end

  def update

    if @sub.update(sub_params)
      redirect_to @sub
    else
      render :edit

    end
    
  
  end

  def destroy
    @sub.destroy
    redirect_to subs_path
  end


  #CRUD actions
  #create/POST  Model_name.create(model_name_params)

  #read/GET see the methods in index, show, new, edit

  #update/PUT Model_name.find(params[:id]).update(model_name_params)

  #destroy/DELETE Model_name.find(params[:id]).destroy

  private

  #model_name_params
  # always private
    # params.require(:model_name).permit(:everything in the db)

    def subs_params
      params.require(:sub).permit(:name)
    end

    def find_sub
      @sub = Sub.find(params[:id])
    end
end
