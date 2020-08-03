class ContentsController < ApplicationController
  before_action :set_group
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @content = Content.new
    @contents = Content.includes(:text).order("created_at DESC")
    if @content.save
      respond_to do |format|
        format.json
      end
    else
      @contents = @group.contents.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end

  end

  def new
    @content = Content.new
    @group.users << current_user
  end

  def create
    @content = @group.contents.new(content_params)
    @content.save
    redirect_to group_contents_path
    # if @content.save
    #   respond_to do |format|
    #     format.json
    #   end
    # else
    #   @contents = @group.contents.includes(:user)
    #   flash.now[:alert] = 'メッセージを入力してください。'
    #   render :index
    # end
  end

  def destroy
    content = Content.find(params[:id])
    content.destroy
    redirect_to group_contents_path
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    content = Content.find(params[:id])
    content.update(content_params)
  end

  # def show
  #   @comment = Comment.new
  #   @comments = @content.comments.includes(:user)
  # end

  def search
    @contents = Content.search(params[:keyword])
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
  end

  private

  def content_params
    params.require(:content).permit(:text, :image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
