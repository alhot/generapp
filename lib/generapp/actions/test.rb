module Generapp
  module Actions
    module Test
      def generate_rspec
        generate 'rspec:install'
      end

      def configure_rspec
        remove_file 'spec/rails_helper.rb'
        copy_file 'spec/rails_helper.rb',
                  'spec/rails_helper.rb'
      end

      def enable_database_cleaner
        copy_file 'spec/database_cleaner.rb',
                  'spec/support/database_cleaner.rb'
      end

      def enable_devise_tests
        copy_file 'spec/devise.rb',
                  'spec/support/devise.rb'
      end

      def provide_shoulda_matchers_config
        copy_file 'spec/shoulda_matchers_config.rb',
                  'spec/support/shoulda_matchers.rb'
      end

      def spec_folders
        %w(spec/lib spec/controllers spec/helpers spec/support/matchers spec/support/mixins spec/support/shared_examples).each do |dir|
          empty_directory_with_keep_file "#{dir}"
        end
      end

      def configure_coverage
        copy_file 'simplecov', '.simplecov'
      end

      def configure_ci
        template 'circle.yml.erb', 'circle.yml'
      end
    end
  end
end
