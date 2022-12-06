def advent(guide)
  guide.map{|i| score(i) }
end

def score(match)
  win_or_lose(match)
rescue => e
  puts e.inspect
end

def shape(match)
  puts match
  case match[1]
  when 'X'
    1
  when 'Y'
    2
  when 'Z'
    3
  end
end

def win_or_lose(match)
  case match[0]
  when 'A'
    case match[1]
    when 'X'
      3
    when 'Y'
      4
    when 'Z'
      8
    end
  when 'B'
    case match[1]
    when 'X'
      1
    when 'Y'
      5
    when 'Z'
      9
    end
  when 'C'
    case match[1]
    when 'X'
      2
    when 'Y'
      6
    when 'Z'
      7
    end
  end
end
