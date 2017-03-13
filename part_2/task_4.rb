# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

alphabet = ('A'..'Z')
vowels = %w(A E I O U Y)

hash_vowels = {}

alphabet.each.with_index(1) do |letter, index|
  hash_vowels[letter] = index if vowels.include?(letter)
end

p hash_vowels