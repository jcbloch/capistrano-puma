module Capistrano
  module NginxPuma
    module Generators
      class ConfigGenerator < Rails::Generators::Base
        desc "Create local nginx and puma configuration files for customization"
        source_root File.expand_path('../templates', __FILE__)
        argument :templates_path, :type => :string,
          :default => "config/deploy/templates",
          :banner => "path to templates"

        def copy_template
          copy_to_templates_path("nginx_conf.erb")
          copy_to_templates_path("puma_monit.conf.erb")
          copy_to_templates_path("puma-deb.erb")
          copy_to_templates_path("puma-rpm.erb")
          copy_to_templates_path("puma.rb.erb")
          copy_to_templates_path("run-puma.rb.erb")

          # copy_file "puma_init.erb", "#{templates_path}/puma_init.erb"
          # copy_file "logrotate.erb", "#{templates_path}/logrotate.erb"
        end

        def copy_to_templates_path(f)
          copy_file "../../../../capistrano/templates/#{f}",  "#{templates_path}/#{f}"
        end

      end
    end
  end
end
