ActiveAdmin.register Post do
    decorate_with PostDecorator
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  menu priority: 1
  menu parent: "Blog"

  permit_params do
    permitted = [ :title, :description, :is_status ]
    permitted << :other if params[:action] == "create"
    permitted
  end

  filter :title
  actions :all, except: []

  order_by(:title) do |order_clause|
   if order_clause.order == "desc"
     [ order_clause.to_sql, "NULLS LAST" ].join(" ")
   else
     [ order_clause.to_sql, "NULLS FIRST" ].join(" ")
   end
end

 controller do
    def csv_filename
      "Post Details.csv"
    end
  end

  csv do
    column :title
    column :description
    column :created_at
  end

  index tbody_html: { class: "my-class" } do
    selectable_column
    column "My post title", :title do |post|
      if post.is_status?
        link_to post.title, admin_post_path(post)
      else
        post.title
      end
    end

    column :description, sortable: false
    column :created_at
    column :is_status
    column("Toggle Status") do |post|
      link_to (post.is_status ? "Disable" : "Enable"),
              toggle_status_admin_post_path(post),
              method: :put,
              data: { confirm: "Are you sure you want to #{post.is_status ? 'disable' : 'enable'} this post?" }
    end

    actions defaults: false do |post|
      if post.is_status == true
        item "edit", edit_admin_post_path(post)
      else
        span "edit", style: "color: gray; cursor: not-allowed;"
      end
    end
  end

  #  form title: 'A custom title' do |f|
  #   inputs 'Details' do
  #     input :title
  #     input :description, label: "post description"
  #     li "Created at #{f.object.created_at}" unless f.object.new_record?
  #   end
  #   panel 'Markup' do
  #     "The following can be used in the content below..."
  #   end
  #   inputs 'Content', :description
  #   para "Press cancel to return to the list without saving."
  #   actions
  # end

  form partial: "form"
    # config.create_another = true

    # custom show page
    show do
      table_for post  do
        column :id
        column :title
        column :description
        column :created_at
        column :is_status
      end
      div do
        link_to "← Back to Posts", admin_posts_path
      end

    panel "Post Details" do
      render partial: "details", locals: { post: post }
    end
  end



  # side bar
  sidebar :help, only: :index do
    para "Need help? Email us at help@example.com"
  end

  sidebar :help, only: :show do
    ul do
      li "Second List First Item"
      li "Second List Second Item"
      li "go to our website"
    end
  end

  sidebar :help, only: :show, partial: "form"


  # batch_action-for don't delete this
  # batch_action :destroy do |ids|
  #   redirect_to collection_path, alert: "Didn't really delete these!"
  # end

  # batch_action_custom
  batch_action :delete_custom do |ids|
    batch_action_collection.find(ids).each do |post|
      post.destroy
    end
      redirect_to collection_path, alert: "post deleted."
  end

  # enable_posts
  batch_action :enable_posts do |ids|
    Post.where(id: ids).update_all(is_status: true)
    redirect_to collection_path, notice: "Selected posts enabled."
  end

  # disable_posts
  batch_action :disable_posts do |ids|
    Post.where(id: ids).update_all(is_status: false)
    redirect_to collection_path, notice: "Selected posts disabled."
  end

    # controller action
    member_action :toggle_status, method: :put do
      resource.update!(is_status: !resource.is_status)
      redirect_to resource_path
    end
end
