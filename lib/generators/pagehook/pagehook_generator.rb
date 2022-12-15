class PagehookGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("../templates", __FILE__)
  class_option :lang, type: :string, default: "ts"

  def generate_script
    case options[:lang].downcase
    when "js", "javascript"
      template "hook.js.erb", "app/javascript/pagehook/#{view_path}.js"
    when "ts", "typescript"
      template "hook.ts.erb", "app/javascript/pagehook/#{view_path}.ts"
    else
      raise "Unknown language: #{lang}"
    end
  end

  private
  def view_path
    file_path.gsub(/\..+/, "")
  end
end
