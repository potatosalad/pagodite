class <%= class_name %>Controller < Pagodite::ApplicationController
<% for action in actions -%>
  def <%= action %>
  end

<% end -%>
end
