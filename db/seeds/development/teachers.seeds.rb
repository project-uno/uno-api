puts 'seeding Teachers'

  user_attributes = [
    {first_name:"Jonathan",last_name:"Ryan"},
    {first_name:"Larry",last_name:"Garcia"},
    {first_name:"Jeremy",last_name:"Martinez"},
    {first_name:"Dorothy",last_name:"Myers"},
    {first_name:"Shawn",last_name:"Payne"},
    {first_name:"Sandra",last_name:"Tucker"},
    {first_name:"Howard",last_name:"Gomez"},
    {first_name:"Kathryn",last_name:"Bailey"},
    {first_name:"Kenneth",last_name:"Palmer"},
    {first_name:"Angela",last_name:"Schmidt"},
    {first_name:"Donna",last_name:"Evans"},
    {first_name:"Andrea",last_name:"Chapman"},
    {first_name:"Steven",last_name:"Russell"},
    {first_name:"Sandra",last_name:"Wheeler"},
    {first_name:"Dennis",last_name:"Boyd"},
    {first_name:"Phyllis",last_name:"Anderson"},
    {first_name:"Anne",last_name:"Ramos"},
    {first_name:"Annie",last_name:"Garza"},
    {first_name:"Howard",last_name:"Larson"},
    {first_name:"Nicole",last_name:"Howard"}
  ]

  user_attributes.each do |attributes|
    school_id = sprintf('%05d', rand.to_s[2..6].to_i)
    attributes.merge!(email: "inigo.sarmiento+#{school_id}@gmail.com", school_id: school_id )
    Teacher.create user_attributes: attributes
  end

  puts "done seeding teachers"
