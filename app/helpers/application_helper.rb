module ApplicationHelper
  def bootstrap_class_for_flash(type)
    case type
      when 'notice' then "my-alert-info"
      when 'success' then "my-alert my-success"
      when 'error' then "my-alert my-danger"
      when 'alert' then "my-alert my-warning"
    end
  end
end
