require "spec_helper"

describe PagehookRails::PagehookHelper, type: "helper" do
  describe "pagehook" do
    let(:html) { helper.pagehook("articles/index", id: 123) }
    let(:node) { Nokogiri.parse(html).children.first }
    it "should be html_safe" do
      html.should be_html_safe
    end
    it "has attribute; type='application/json'" do
      node["type"].should == "application/json"
    end
    it "has attribute; data-pagehook='articles/index'" do
      node["data-pagehook"].should == "articles/index"
    end
    it "has data as json" do
      JSON.parse(node.text)["id"].should == 123
    end
    context 'data includes html special character' do
      let(:html) { helper.pagehook("articles/index", script: '"}</script><script>alert(1);</script>') }
      it "encodes special character in string" do
        html.should include "\\u003c"
      end
      it "has data as json" do
        JSON.parse(node.text)["script"].should == '"}</script><script>alert(1);</script>'
      end
    end
  end
end
