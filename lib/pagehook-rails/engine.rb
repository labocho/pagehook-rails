module PagehookRails
  class Engine < ::Rails::Engine
    isolate_namespace PagehookRails

    initializer "pagehook-rails.action_controller" do |app|
      ActiveSupport.on_load :action_controller do
        ActionController::Base.include PagehookRails::PagehookHelper
      end
    end
  end
end
