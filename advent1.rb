def advent
  file = File.open("input.txt")
  contents = file.read
  elf_hash = Hash.new(0)
  elf_counter = 0
  contents.split("\n").each do |row|
    if row.empty?
      elf_counter += 1
    else
      elf_hash[elf_counter] += row.to_i
    end
  end

  elf_hash
end
