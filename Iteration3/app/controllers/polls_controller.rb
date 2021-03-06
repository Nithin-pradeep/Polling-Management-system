class PollsController < ApplicationController
  def index
    #@user=User.find_by_id(params[:id])
    @polls = Poll.where(user_id: params[:user_id])
    #@polls = Poll.all
    
  end

  def new
    @poll = Poll.new
  end
  
  def edit
    @poll = Poll.find_by_id(params[:id])
  end
  
   def update
    @poll = Poll.find_by_id(params[:id])
    if @poll.update_attributes(poll_params)
      flash[:success] = 'Poll was updated!'
      redirect_to polls_path
    else
      render 'edit'
    end
   end

def destroy
  @poll = Poll.find_by_id(params[:id])
  if @poll.destroy
    flash[:success] = 'Poll was destroyed!'
  else
    flash[:warning] = 'Error destroying poll...'
  end
  redirect_to polls_path
end

  def create
    @poll = Poll.new(poll_params)
    @poll.user_id=params[:user_id]
    if @poll.save
      flash[:success] = 'Poll was created!'
      redirect_to user_polls_path
    else
      render 'new'
    end
  end
  
  def show
    #@poll = Poll.find_by_id(params[:id])
    
    @poll = Poll.includes(:vote_options).find_by_id(params[:id])

  end

  private

  def poll_params
    
    params.require(:poll).permit(:topic, vote_options_attributes: [:id, :title, :_destroy])
  end
end
