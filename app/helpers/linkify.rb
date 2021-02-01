# frozen_string_literal: true

def linkify(list)
  list.map do |el|
    text = textify(el, :date)
    "%a{href: '/record/#{el.gsub(%r{\d{4}\.md$}, '')}'} #{text}"
  end.uniq
end

