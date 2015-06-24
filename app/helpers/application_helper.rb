module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
    when :alert   then 'alert-error'
    when :notice  then 'alert-success'
    end
  end
end
