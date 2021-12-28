#encoding: UTF-8
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
require 'Digest'

puts 'Введите слово или фразу для шифрования:'

word = STDIN.gets.chomp

puts 'Каким способом зашифровать?'
puts '1. MD5\n2. SHA1'
encrypt_method = STDIN.gets.to_i

until encrypt_method.between?(1, 2)
  puts 'Выберите 1 или 2'
  encrypt_method = STDIN.gets.to_i
end

case encrypt_method
when 1
  puts Digest::MD5.hexdigest(word)
when 2
  puts Digest::SHA1.hexdigest(word)
else
  puts "..."
end
