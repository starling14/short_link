# Uses 2 separate sets of chars for avoiding sequence and repeatability in the result string
module ShortUriGenerator
  CHARS_START_IDX = 0
  CHARS = ['23456789BCDFGHJKbcdfghjk', 'MNPQRSTVWXYZmnpqrstvwxyz']
  CHARS_LENGTH = 24

  # encodes integer to string
  def self.encode(number)
    result = ''
    chars_part = CHARS_START_IDX
    until number == 0
      result << CHARS[chars_part][number % CHARS_LENGTH]
      number /= CHARS_LENGTH
      chars_part = chars_part_toggle(chars_part)
    end
    result
  end

  # decodes string to integer
  def self.decode(str)
    chars_part = CHARS_START_IDX
    str.chars.each_with_index.inject(0) do |sum,(char,i)|
      res_sum = sum + CHARS[chars_part].index(char) * CHARS_LENGTH**i
      chars_part = chars_part_toggle(chars_part)
      res_sum
    end
  end

  def self.chars_part_toggle(current_part)
    current_part == 0 ? 1 : 0
  end

  # returns integer offset for getting a string with specific length
  def self.id_offset(chars_count)
    CHARS_LENGTH**(chars_count - 1) - 1
  end
end