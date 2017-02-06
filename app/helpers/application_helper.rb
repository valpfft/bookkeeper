module ApplicationHelper
  def active_class(name); "active" if params[:controller] == name; end
end
