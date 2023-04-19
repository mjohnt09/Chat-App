class MessagesController < ApplicationController
  def index
    if @current_user

      matching_messages = Message.all

    @list_of_messages = matching_messages.order({ :created_at => :desc })

    render({ :template => "messages/index.html.erb" })

    else 

      redirect_to("/user_sign_in", { :notice => "Not Logged in. Please log in"} )

 
    end
  end

  def show
    the_id = params.fetch("path_id")

    matching_messages = Message.where({ :id => the_id })

    @the_message = matching_messages.at(0)

    render({ :template => "messages/show.html.erb" })
  end

  def create
    the_message = Message.new
    the_message.user_id = session.fetch(:user_id)
    the_message.content = params.fetch("query_content")

    if the_message.valid?
      the_message.save
      redirect_to("/", { :notice => "Message created successfully." })
    else
      redirect_to("/", { :alert => the_message.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_message = Message.where({ :id => the_id }).at(0)

    the_message.user_id = params.fetch("query_user_id")
    the_message.content = params.fetch("query_content")

    if the_message.valid?
      the_message.save
      redirect_to("/", { :notice => "Message updated successfully."} )
    else
      redirect_to("/", { :alert => the_message.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_message = Message.where({ :id => the_id }).at(0)

    the_message.destroy

    redirect_to("/", { :notice => "Message deleted successfully."} )
  end
end
