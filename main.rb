require 'digest'

encryption = %w[MD5 SHA1 SHA2]

puts 'Введите слово или фразу для шифрования:'

word = $stdin.gets.chomp

puts 'Каким способом зашифровать?'
encryption.each_with_index { |item, index| puts "#{index + 1}. #{item}" }

encrypt_by_index = $stdin.gets.to_i

until encrypt_by_index.between?(1, encryption.size)
  puts 'Выберите 1-3'
  encrypt_by_index = $stdin.gets.to_i
end

case encrypt_by_index - 1
when 0
  puts "md5: #{Digest::MD5.hexdigest(word)}"
when 1
  puts "sha1: #{Digest::SHA1.hexdigest(word)}"
when 2
  puts "sha2: #{Digest::SHA2.hexdigest(word)}"
end
