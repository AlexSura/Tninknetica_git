
alphabet = "abcdefghijklmnopqrstuvwxyz"
vowel = "aeiouy"
vowels = vowel.split('') #преобраз в массив

v_hash = {}

vowels.each do |vowel|			# перебор елементов массива
	v_hash[vowel] = alphabet.index(vowel) + 1     # v_hash[vowel] каждый елемент массива являеться ключом, 
end

puts v_hash
