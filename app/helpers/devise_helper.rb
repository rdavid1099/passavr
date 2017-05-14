module DeviseHelper
  def devise_error_messages!
    unless resource.errors.full_messages.empty?
      "<div class='alert alert-danger'>" +
        resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join +
      "</div>"
    end
  end
end
