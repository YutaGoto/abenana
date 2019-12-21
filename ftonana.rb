strs_array = [
  ['+', "ミミミン"],
  ['-', "！"],
  ['[', "ウサウサウーサ"],
  [']', "ウーサミン"],
  ['>', "ウサミン"],
  ['<', "ナナー"],
  ['.', "うードッカーン"],
  [',', "メルヘンチェーンジ"],
];

def replaceString(f,strs_array)
  f.rewind
  body = f.read
  strs_array.each do |str_array|
    body = body.gsub(str_array[0]) do |tmp|
      str_array[1]
    end
  end

  f.rewind
  f.puts body
end

File.open(ARGV[0], "r+") do |f|
  f.flock(File::LOCK_EX)
  replaceString(f, strs_array)
  f.truncate(f.tell)
end

