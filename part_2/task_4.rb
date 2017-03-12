# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

alphabet = ('A'..'Z').to_a
vowels = ["A", "E", "I", "O", "U", "Y"]

hash_vowels = {}

alphabet.each_with_index do |letter, index|
  hash_vowels[letter] = index + 1 if vowels.include?(letter)
end

p hash_vowels