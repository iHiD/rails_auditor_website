project = Project.create!(name: 'Rails Auditor Website', github_repository: "ihid/rails_auditor_website", github_branch: "master")
audit   = project.audits.create!

FileUtils.cp_r(Rails.root.join("spec/applications/default_3_2_3"), audit.local_repository_path)
audit.parse
audit.status_id = Audit::Status.completed
audit.save!