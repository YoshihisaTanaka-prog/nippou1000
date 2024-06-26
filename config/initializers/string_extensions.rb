class String
  
  def change_first_person from_array, to_first_person
    modified_text = self
    from_array.each do |from|
      modified_text = modified_text.gsub(from, to_first_person)
    end
    modified_text = modified_text.gsub("今日", "本日")
    return modified_text
  end

  def indention indent_num, is_need_initial_dot, is_init
    return_text = ""
    for i in 1..indent_num do
      return_text = return_text + "　"
    end
    if is_need_initial_dot
      if is_init
        return_text = return_text + "・"
      else
        return_text = return_text + "　"
      end
    end
    return return_text
  end

  def begin_on_a_new_line char_num, indent_num, is_need_initial_dot
    modified_text = ""
    half_width_chars = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a + ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')', '-', '_', '=', '+', '[', ']', '{', '}', '|', '\\', ';', ':', '\'', '"', ',', '.', '<', '>', '/', '?', '`', '~']
    half_width_chars = half_width_chars + "ｱｲｳｴｵｶﾞｷｸｹｺｻｼｽｾｿﾀﾁﾂﾃﾄﾅﾆﾇﾈﾉﾊﾟﾋﾌﾍﾎﾏﾐﾑﾒﾓﾔﾕﾖﾗﾘﾙﾚﾛﾜｦﾝｧｨｩｪｫｬｭｮ".chars
    is_init = true
    self.split("\n").each do |word|
      if word != ""
        count = 0
        modified_text = modified_text + indention(indent_num, is_need_initial_dot, is_init)
        is_init = false
        chars = word.chars
        is_skip = false
        chars.each_with_index do |c,i|
          if is_skip
            is_skip = false
            next
          end
          if half_width_chars.include?(c)
            count = count + 1
          else
            count = count + 2
          end
          modified_text = modified_text + c
          is_skip = false
          if count >= char_num * 2
            ii = i
            unless i == chars.length - 1
              if ["。", "、", "！", "？", ".", ",", "!", "?"].include?(chars[i+1])
                modified_text = modified_text + chars[i+1]
                is_skip = true
                ii = ii + 1
              end
              unless ii == chars.length - 1
                count = 0
                modified_text = modified_text + "\n" + indention(indent_num, is_need_initial_dot, is_init)
              end
            end
          end
        end
      end
    end
    return modified_text
  end
  
end

class Integer
  def to_b?
    !self.zero?
  end
end