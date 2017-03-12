# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

arr = ('A'..'Z').to_a
vowels = ["A", "E", "I", "O", "U", "Y"]

h = Hash.new
i = 1

arr.each do |l|
    h[l] = i
    i += 1
end

p h.keep_if { |letter, num| vowels.include?(letter) }