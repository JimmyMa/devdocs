module Docs
  class XsltXpath < Mdn
    self.name = 'XSLT & XPath'
    self.slug = 'xslt_xpath'
    self.base_url = 'https://developer.mozilla.org/zh-CN/docs/Web'
    self.root_path = '/XSLT'
    self.initial_paths = %w(/XPath)

    html_filters.push 'xslt_xpath/clean_html', 'xslt_xpath/entries', 'title'

    options[:root_title] = 'XSLT'

    options[:only_patterns] = [/\A\/XSLT/, /\A\/XPath/]

    options[:fix_urls] = ->(url) do
      url.sub! 'https://developer.mozilla.org/en/XPath', "#{XsltXpath.base_url}/XPath"
      url.sub! 'https://developer.mozilla.org/en/XSLT', "#{XsltXpath.base_url}/XSLT"
      url.sub! 'https://developer.mozilla.org/zh-CN/docs/XPath', "#{XsltXpath.base_url}/XPath"
      url.sub! 'https://developer.mozilla.org/zh-CN/docs/XSLT', "#{XsltXpath.base_url}/XSLT"
      url
    end
  end
end
