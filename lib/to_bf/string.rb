# frozen_string_literal: true

# monkey patching the String Core class to add the to_bf method
class String
  ACCUMULATOR = 10

  def to_bf
    return "" if empty?
    raise "Unicode string are not supported" if bytes.length != length

    "#{"+" * ACCUMULATOR}[#{bytes_piles}#{"<" * bytes.length}-]#{reminders_piles}"
  end

  def bytes_piles
    bytes.map { |byte| ">#{"+" * (byte / ACCUMULATOR)}" }.join
  end

  def reminders_piles
    bytes.map { |byte| ">#{"+" * (byte % ACCUMULATOR)}." }.join
  end
end
