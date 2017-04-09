# i need to create a string dimond with new lines and when given a letter the
# diamond will be created starting with A being the smallest line and each
# next letter in the alphabet will be the next line making the diamond and
# as it winds back down to a point the alphabet letters reverse back to A.

# when the class is called is when the widest point letter is given.

# class Diamond
#   ALPH = ('A'..'Z').to_a

#   def self.make_diamond(letter)
#     letter.upcase == "A" ? (return "A\n") : result = ''
#     rows = ALPH.index(letter.upcase) + 1
#     rows.times { |row| result << (space_letter(row).center(rows * 2) + "\n") }
#     result + result.split("\n").reverse.drop(1).join("\n") + "\n"
#   end

#   def self.space_letter(idx)
#     idx.zero? ? ALPH[idx] : ALPH[idx] + " " * (idx * 2 - 1) + ALPH[idx]
#   end
# end


class Diamond
  def self.make_diamond(letter)
    @column_mapped_letters = [*'A'..letter].reverse.concat([*'B'..letter])
    @size = @column_mapped_letters.size
    row_mapped_letters = [*'A'..letter].concat([*'A'...letter].reverse)

    row_mapped_letters.map { |char| row(char) }.join
  end

  def self.row(letter)
    @size.times.with_object('') do |idx, row|
      row << (@column_mapped_letters[idx] == letter ? letter : ' ')
    end << "\n"
  end
end