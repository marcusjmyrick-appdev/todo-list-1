class TodoitemsController < ApplicationController
  
  def index
    @next_up_todoitems = Todoitem.where(status: 'Next Up').order(created_at: :desc)
    @in_progress_todoitems = Todoitem.where(status: 'In Progress').order(updated_at: :desc)
    @done_todoitems = Todoitem.where(status: 'Done').order(updated_at: :desc)

    matching_todoitems = Todoitem.all

    @list_of_todoitems = matching_todoitems.order({ :created_at => :desc })

    render({ :template => "todoitems/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_todoitems = Todoitem.where({ :id => the_id })

    @the_todoitem = matching_todoitems.at(0)

    render({ :template => "todoitems/show.html.erb" })
  end

  def create
    the_todoitem = Todoitem.new
    the_todoitem.description = params.fetch("query_description")

    if the_todoitem.valid?
      the_todoitem.save
      redirect_to("/todoitems", { :notice => "Todoitem created successfully." })
    else
      redirect_to("/todoitems", { :alert => the_todoitem.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_todoitem = Todoitem.where({ :id => the_id }).at(0)
  
    the_todoitem.description = params.fetch("query_description")
    the_todoitem.status = params.fetch("query_status")
  
    if the_todoitem.valid?
      the_todoitem.save
      redirect_to("/", { :notice => "Todoitem updated successfully."} )
    else
      redirect_to("/", { :alert => the_todoitem.errors.full_messages.to_sentence })
    end
  end
  

  def destroy
    the_id = params.fetch("path_id")
    the_todoitem = Todoitem.where({ :id => the_id }).at(0)

    the_todoitem.destroy

    redirect_to("/todoitems", { :notice => "Todoitem deleted successfully."} )
  end
end
