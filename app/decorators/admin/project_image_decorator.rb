class Admin::ProjectImageDecorator < Draper::Decorator
  delegate_all

  # TODO social links proj image

  #       <%#         <td><%= link_to 'Show', admin_project_image %1></td> %>
  #       <%#         <td><%= link_to 'Edit', edit_admin_project_image_path(admin_project_image) %1></td> %>
  #       <%#         <td><%= link_to 'Destroy', admin_project_image, method: :delete, data: { confirm: 'Are you sure?' } %1></td> %>
end
