module PagehookRails
  class Engine < ::Rails::Engine
    isolate_namespace PagehookRails

    initializer "pagehook-rails.action_controller" do |app|
      Rails.application.reloader.to_prepare do
        ActionController::Base.helper PagehookRails::PagehookHelper
      end
    end
  end
end
