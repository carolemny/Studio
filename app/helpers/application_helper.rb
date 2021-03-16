module ApplicationHelper
  def bootstrap_class_for_flash(type)
    case type
      when 'notice' then "my-alert-info"
      when 'success' then "my-alert-success"
      when 'error' then "my-alert-danger"
      when 'alert' then "my-alert-warning"
    end
  end
end
