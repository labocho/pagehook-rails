class PagehookGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("../templates", __FILE__)
  class_option :lang, type: :string, default: "js"

  def generate_script
    case options[:lang].downcase
    when "coffee", "coffeescript"
      template "hook.coffee.erb", "app/assets/javascripts/pagehook/#{view_path}.coffee"
    when "js", "javascript"
      template "hook.js.erb", "app/assets/javascripts/pagehook/#{view_path}.js"
    else
      raise "Unknown language: #{lang}"
    end
  end

  private
  def view_path
    file_path.gsub(/\..+/, "")
  end
end
