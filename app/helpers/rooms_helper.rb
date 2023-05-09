module RoomsHelper

  def markdown(text)
    options = {
      hard_wrap: true,
      link_attributes: { rel: 'nofollow', target: '_blank' },
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      quote: true,
    }
    Markdown.new(text, options).to_html.html_safe
  end
end
