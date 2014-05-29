module PagehookRails
  module PagehookHelper
    # <%= pagehook("articles/show", id: 123) %>
    # makes
    # <script type="application/json" data-pagehook-name="articles/show">{"id": 123}</script>
    def pagehook(name, data = {})
      data_json = PagehookRails::PagehookHelper.escape_json(data.to_json)
      content_tag(:script, data_json, type: "application/json", "data-pagehook" => name)
    end

    # convert html special characters to \uhhhh form
    def self.escape_json(json)
      json.gsub(/[\u2028\u2029><&]/u) {|s|
        "\\u#{s.ord.to_s(16).rjust(4, "0")}"
      }.html_safe
    end
  end
end
