puts 'seeding Sections'

(1..4).each do |level|
  ('A'..'D').each do |name|
    Section.create name: "Section #{level}#{name}", level: "#{level}"
  end
end

puts "seeding sections done"
