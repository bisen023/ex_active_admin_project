module ActiveAdmin
  module Views
    class IndexCustom < ActiveAdmin::Component
      # Set up the component to take parameters (e.g., resource, columns, etc.)
      def build(resource)
        # Start building the custom index
        @resource = resource

        # Example of custom content rendering
        h3 "Custom Index View for #{@resource.name}"

        # You can add more customizations, like custom HTML or data rendering
        div class: "custom-index-content" do
          # Loop over resources and render custom table
          table do
            thead do
              tr do
                th "ID"
                th "Title"
                th "Content"
                th "Created At"
              end
            end
            tbody do
              @resource.each do |post|
                tr do
                  td post.id
                  td post.title
                  td truncate(post.descrption, length: 100)  # Truncated content
                  td post.created_at.strftime("%B %d, %Y")  # Formatted date
                end
              end
            end
          end
        end
      end
    end
  end
end
