project_one = {
    :address => "123 Test Ave, New York, NY 16798",
    :user_id => "1",
}

project_two = {
    :address => "456 Testing Street, San Diego, CA 64967",
    :user_id => "2",
}

Project.create(project_one)
Project.create(project_two)

goal1 = {
    :title => "Kitchen",
    :description => "Replace all appliances with stainless steel", 
    :budget => "3000", 
    :project_id => 1
}

goal2 = {
    :title => "Bathroom",
    :description => "Re-tile floor and shower", 
    :budget => "200", 
    :project_id => 1
}

goal3 = {
    :title => "Front Porch",
    :description => "Add roof to front deck", 
    :budget => "1000", 
    :project_id => 1
}

goal4 = {
    :title => "Open Floor Plan",
    :description => "Remove wall between kitchen and living room", 
    :budget => "2000", 
    :project_id => 2
}

goal5 = {
    :title => "Patio",
    :description => "Replace gravel with flagstones", 
    :budget => "200", 
    :project_id => 2
}

goal6 = {
    :title => "Garage",
    :description => "Install 2-car garage", 
    :budget => "5000", 
    :project_id => 2
}

Goal.create(goal1)
Goal.create(goal2)
Goal.create(goal3)
Goal.create(goal4)
Goal.create(goal5)
Goal.create(goal6)







