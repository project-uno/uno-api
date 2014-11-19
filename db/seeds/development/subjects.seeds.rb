after "development:teachers" do
  puts 'seeding Subjects'

  subjects = [
    { name: "MATH01", description: "Algebra"},
    { name: "MATH02", description: "Quantum Computation"},
    { name: "MATH03", description: "Geometric Combinatorics"},
    { name: "MATH04", description: "Infinite Random Matrix Theory"},
    { name: "Filipino 1", description: "Wika, Ibong Adarna"},
    { name: "Filipino 2", description: "Wika, Florante at Laura"},
    { name: "Filipino 3", description: "Wika, Noli Me Tangere"},
    { name: "Filipino 4", description: "Wika, EL Filibusterismo"},
  ]

  subjects.each do |subject|
    Subject.create name: subject[:name], description: subject[:description]
  end

  puts 'done seeding students'

end
