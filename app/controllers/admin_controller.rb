class AdminController < ApplicationController
  def index
  end

  def data
    users = User.all
    
    render :json => {
      :total_count => users.length,
      :pos => 0,
      :rows => users.map do |user|
        {
          :id => user.id,
          :data => [user.first_name, user.last_name, user.phone]
        }
      end
    }
  end

  def db_action
    @mode = params["!nativeeditor_status"]
    first_name = params["c0"]
    last_name = params['c1']
    phone = params['c2']
    
    @id = params["gr_id"]
    
    case @mode
    when "inserted"
      user = User.create :first_name => first_name, :last_name => last_name, :phone => phone
      @tid = user.id
      
    when "deleted"
      User.find(@id).destroy
      @tid = @id 
      
    when "updated"
      user = User.find(@id)
      user.first_name = first_name
      user.last_name = last_name
      user.phone = phone
	user.save
      @tid = @id
    end
  end
end
