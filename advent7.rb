def parse_contents(contents)
  structure = {'root' => 0}
  current_folder = []

  contents.each do |row|
    if row[0] == '$' #command
      pieces = row.split(' ')
      if pieces[1] == 'cd'
        if pieces[2] == '/'
          current_folder = []
        elsif pieces[2] == '..'
          current_folder.pop
        else
          current_folder << pieces[2]
        end
      end
    elsif row[0..2] == 'dir'
    else #file
      puts row
      size, name = row.split(' ')

      temp_folder = []

      structure['root'] += size.to_i

      current_folder.each do |f|
        temp_folder << f
        structure[temp_folder.join('/')] ||= 0
        structure[temp_folder.join('/')] += size.to_i
      end
    end
  end

  structure
end

def get_answer_one(structure)
  structure.select { |k, v| v < 100000 }.values.sum
end

def get_answer_two(structure)
  used_size = structure['root']

  trying_to_free_up = used_size - 40000000

  structure.select{|k, v| v > trying_to_free_up }.sort_by{|k, v| v }.first
end

