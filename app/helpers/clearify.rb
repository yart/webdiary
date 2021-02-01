# frozen_string_literal: true

def clearify(text)
  text.gsub(%r{^(.+-//-\n\n)(.+)}m, '\2')
end
