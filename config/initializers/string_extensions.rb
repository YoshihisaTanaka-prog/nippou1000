class String
  def change_first_person from_array, to_first_person
    modified_text = self
    from_array.each do |from|
      modified_text = modified_text.gsub(from, to_first_person)
    end
    return modified_text
  end
end