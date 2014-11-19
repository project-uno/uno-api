after "development:students" do
  puts 'grouping students into sections'

    Student.all.each_slice(25).each do |students|
      level = rand(1..4).to_s
      sections = Section.where(level: level)
      section = sections.select{ |s| s.students.count < 25 }.try(:first)
      students.each{ |s| s.update_attribute(:section_id, section.id) } if section.present?
    end

  puts 'done grouping students into sections'
end
