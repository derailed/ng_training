module ApplicationHelper  
  def flash_class(level)
    @clazz ||= {notice: :success, alert: :error }
    @class[level.to_sym] || level
  end
end
