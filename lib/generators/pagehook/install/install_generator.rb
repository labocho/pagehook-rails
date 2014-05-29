module Pagehook
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)
    class_option :lang, type: :string, default: "js"

    def copy_loader
      case options[:lang].downcase
      when "coffee", "coffeescript"
        copy_file "pagehook_rails.coffee", "app/assets/javascripts/pagehook_rails.coffee"
      when "js", "javascript"
        copy_file "pagehook_rails.js", "app/assets/javascripts/pagehook_rails.js"
      else
        raise "Unknown language: #{lang}"
      end
    end
  end
end
