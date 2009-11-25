Project.configure do |project|
  # We need to bundle the gems before to do the build
  project.build_command = 'gem bundle && rake'
end