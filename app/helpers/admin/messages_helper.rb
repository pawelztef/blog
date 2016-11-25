module Admin::MessagesHelper
  def message_weight message
    message.status == false ? 'font-weight:bold' : 'font-weight:normal'
  end
  def build_read_status_link message
    if message.status == true
      link_to "<sapn class='fa fa-envelope-open-o'></span> Un-read".html_safe, admin_message_path(message, status: false), method: :put, class: 'btn btn-xs btn-default'
    else
      link_to "<span class='fa fa-envelope-o'> Read".html_safe, admin_message_path(message, status: true), method: :put, class: 'btn btn-xs btn-default'
    end
  end
end
