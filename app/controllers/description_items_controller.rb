class DescriptionItemsController < ApplicationController
  before_action :set_description_item, only: [:show, :edit, :update, :destroy]

  # GET /description_items
  # GET /description_items.json
  def index
    @description_items = DescriptionItem.all
  end

  # GET /description_items/1
  # GET /description_items/1.json
  def show
  end

  # GET /description_items/new
  def new
    @description_item = DescriptionItem.new
  end

  # GET /description_items/1/edit
  def edit
  end

  # POST /description_items
  # POST /description_items.json
  def create
    @description_item = DescriptionItem.new(description_item_params)

    respond_to do |format|
      if @description_item.save
        format.html { redirect_to @description_item, notice: 'Description item was successfully created.' }
        format.json { render :show, status: :created, location: @description_item }
      else
        format.html { render :new }
        format.json { render json: @description_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /description_items/1
  # PATCH/PUT /description_items/1.json
  def update
    respond_to do |format|
      if @description_item.update(description_item_params)
        format.html { redirect_to @description_item, notice: 'Description item was successfully updated.' }
        format.json { render :show, status: :ok, location: @description_item }
      else
        format.html { render :edit }
        format.json { render json: @description_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /description_items/1
  # DELETE /description_items/1.json
  def destroy
    @description_item.destroy
    respond_to do |format|
      format.html { redirect_to description_items_url, notice: 'Description item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_description_item
      @description_item = DescriptionItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def description_item_params
      params.require(:description_item).permit(:title, :long_description, :project_id)
    end
end
