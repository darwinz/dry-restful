# frozen_string_literal: true

namespace :dry_restful_api do
  desc 'Rake task for printing the important stuff'
  task :print_important_stuff, [:important_string] do |_t, args|
    puts "Starting task"
    puts "Printing the important string"
    puts args['important_string']
    puts "Completed task"
  end
end
