strs_array_array = [
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

files = Dir.glob('abe.nana')

files.each do |item|
  open(item,"r+") {|f|
    f.flock(File::LOCK_EX)
    replaceString(f, strs_array)
    f.truncate(f.tell)
  }
end
