users = [
  {name: 'Jon', title: 'CEO', company: 'company 1',
    education: 'Bachelor', gender: 'Male'},
  {name: 'Bin', title: 'CFO', company: 'company 3',
      education: 'Bachelor', gender: 'Male'},
  {name: 'Ting', title: 'CMO', company: 'company 2',
      education: 'Master', gender: 'Female'},
  {name: 'User1', title: 'title 1', company: 'company 2', education: 'Bachelor', gender: 'Female'},
  {name: 'User2', title: 'title 1', company: 'company 2', education: 'Bachelor', gender: 'Female'},
  {name: 'User3', title: 'title 1', company: 'company 2', education: 'Bachelor', gender: 'Female'},
  {name: 'User4', title: 'title 1', company: 'company 2', education: 'Bachelor', gender: 'Female'},
  {name: 'User5', title: 'title 1', company: 'company 2', education: 'Bachelor', gender: 'Female'},
  {name: 'User6', title: 'title 1', company: 'company 2', education: 'Bachelor', gender: 'Female'},
]

users.each do |u|
  User.create(u)
end