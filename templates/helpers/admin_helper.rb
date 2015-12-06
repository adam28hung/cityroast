module AdministrationHelper

  def notice_message
    alert_types = { :notice => :success, :alert => :danger }

    close_button_options = { :class => "close", "data-dismiss" => "alert", "aria-hidden" => true}
    close_button = content_tag(:button, "×", close_button_options)

    alerts = flash.map do |type, message|
      alert_content = close_button + message

      alert_type = alert_types[type.to_sym] || type
      alert_class = "alert alert-#{alert_type} alert-dismissable"

      content_tag(:div, alert_content, :class => alert_class)
    end

    alerts.join("\n").html_safe
  end

  def administration_function_tag(title)
    action_options = { index: '所有', edit: '編輯', new: '新增'}
    translated_action = action_options[action_name.to_sym] || "" #action_name
    content_tag(:h1, "#{translated_action} #{title}", class: 'page-header')
  end

end
