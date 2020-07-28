class ContentsController < ApplicationController
  before_action :set_group

  def index
    @group = Group.include(:user)
    @contents = Content.includes(:user).order("created_at DESC")
  end

  def new
    @content = Content.new
  end

  def create
    @content = @group.contents.new(content_params)
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

  def destroy
    content = Content.find(params[:id])
    content.destroy
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    content = Content.find(params[:id])
    content.update(content_params)
  end

  def show
    @comment = Comment.new
    @comments = @content.comments.includes(:user)
  end

  def search
    @contents = Content.search(params[:keyword])
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
  end

  private

  def content_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
