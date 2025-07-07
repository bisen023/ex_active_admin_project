ActiveAdmin.register_page "Calendar"  do
  content do
    render partial: "calendar"
  end

  breadcrumb do
    [ "admin", "calendar" ]
  end

  action_item :view_site do
    link_to "View Site", "/"
  end

  page_action :add_event, method: :post do
    redirect_to admin_calendar_path, notice: "Your event was added"
  end

action_item :add do
  link_to "Add Event", admin_calendar_add_event_path, method: :post
end
end
