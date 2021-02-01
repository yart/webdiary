# frozen_string_literal: true

def textify(number, part = nil)
  case part
  when :date
    number.gsub(%r{^(?<year>\d{4})(?<month>\d{2})(?<day>\d{2})(.*\.md)?}, '\k<year>-\k<month>-\k<day>')
  when :time
    number.gsub(%r{^(.*)(?<hour>\d{2})(?<minute>\d{2})(\.md)?$}, '\k<hour>:\k<minute>')
  else
    number.gsub(%r{(?<year>\d{4})(?<month>\d{2})(?<day>\d{2})(?<hour>\d{2})(?<minute>\d{2})(\.md)?}, '\k<year>-\k<month>-\k<day> \k<hour>:\k<minute>')
  end
end
