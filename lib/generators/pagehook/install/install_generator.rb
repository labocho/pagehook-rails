module Pagehook
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)
    class_option :lang, type: :string, default: "ts"

    def install
      run "yarn add pagehook@^0.1.4"
    end

    def copy_loader
      case options[:lang].downcase
      when "js", "javascript"
        copy_file "pagehook_rails.js", "app/javascript/pagehook_rails.js"
        copy_file "global.js", "app/javascript/pagehook/global.js"
      when "ts", "typescript"
        copy_file "pagehook_rails.ts", "app/javascript/pagehook_rails.ts"
        copy_file "global.ts", "app/javascript/pagehook/global.ts"
      else
        raise "Unknown language: #{lang}"
      end

      case
      when File.exists?("app/javascript/packs/application.ts")
        append_file_with_newline "app/javascript/packs/application.ts", %(\nimport "../pagehook_rails")
      when File.exists?("app/javascript/packs/application.js")
        append_file_with_newline "app/javascript/packs/application.js", %(\nimport "../pagehook_rails")
      end
    end
  end
end
