ActiveAdmin.register Task do

	permit_params :title, :note, :video, :header, :tag, :project_id

	sortable tree: false,
	         sorting_attribute: :tag

	index :as => :sortable do
		label :title

		actions
	end
	index do
		selectable_column
		column :header
		column :title
		column :tag
		column :project

		actions
	end

	form do |f|
		f.input do
			input :project, label: "Project"	
			input :project, label: "Title"
			input :project, label: "Note"
			input :project, label: "Video"
			input :project, label: "Header"
		end

		actions
	end 
end
