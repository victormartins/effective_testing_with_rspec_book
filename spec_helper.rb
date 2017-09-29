# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # :) :) :)
  config.filter_gems_from_backtrace 'rack', 'rack-test', 'sequel', 'sinatra'

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # To see the full backtrace pass the --backtrace or -b flag
  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.filter_run_when_matching :focus
  config.example_status_persistence_file_path = 'example_status_persistence_file.txt'

  config.disable_monkey_patching!

  config.warnings = true

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.profile_examples = 3

  config.order = :random
  Kernel.srand config.seed
end
