# frozen_string_literal: true
module Generapp
  module Actions #:nodoc
    # App configuration associated actions
    module Configuration
      def setup_default_rake_task
        append_file 'Rakefile' do
          rspec_task
        end
      end

      def configure_puma
        copy_file 'config/puma.rb', 'config/puma.rb'
      end

      def set_up_version
        template 'config/version.rb.erb', 'config/initializers/version.rb'
      end

      def set_up_procfile
        copy_file 'Procfile', 'Procfile'
      end

      def generate_devise
        generate 'devise:install'
      end

      protected

      def rspec_task
        <<-RUBY
task(:default).clear
task default: [:spec]

if defined? RSpec
  task(:spec).clear
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.verbose = false
  end
end
        RUBY
      end
    end
  end
end
