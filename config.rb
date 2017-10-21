# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

# helpers do
#   def some_helper
#     'Helping'
#   end
# end
helpers do
  def mailing_list_url
    "//eriedayofcode.us10.list-manage.com/subscribe/post" \
      "?u=3fcd98d64025f034a082fe384&id=bb907d9e18"
  end

  def cfp_url
    'https://goo.gl/forms/hPzcNskx4kLMx6ig1'
  end

  def tickets_url
    "https://eriedayofcode.ticketleap.com/2018/dates/May-16-2018_at_0900AM"
  end

  def social_links
    OpenStruct.new(
      twitter: data.info.twitter_url,
      facebook: data.info.facebook_url
    )
  end

  def venue
    OpenStruct.new(
      name: 'Erie Art Museum',
      url: 'http://erieartmuseum.org',
      street: '411 State St.',
      address_line: 'Erie, PA 16501',
    )
  end

  def close_lodging
    data.lodging.select { |place| place.proximity == 'close' }
  end

  def further_lodging
    data.lodging.select { |place| place.proximity == 'far' }
  end

  def md_text(text)
    Kramdown::Document.new(text).to_html
  end
end



# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end
