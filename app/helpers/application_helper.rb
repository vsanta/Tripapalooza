module ApplicationHelper

  def autotab
    @current_tab ||=0
    @current_tab +=1
  end

  def error_message_on(field)
    flash[:error][field][0] if !flash[:error].nil?
  end

  def error_for(field)
    'error' if !flash[:error].nil? and !flash[:error][field].empty?
  end

end
