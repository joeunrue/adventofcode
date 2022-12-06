def marker_finder(string)
  holding = []
  counter = 0
  answer = nil
  array = string.split('')

  array.each do |c|
    holding << c
    counter += 1

    if holding.length == 14
      uniq_length = holding.uniq.length
      puts "#{counter}: #{uniq_length} : #{holding.join('')}"
      if uniq_length == 14
        answer ||= counter
      else
        holding.shift
      end
    end
  end

  answer
end
