if (u1 = User.find_by_email('admin@localhost')).nil?
  u1 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'admin@localhost')
  u1.activate!
end
if (u2 = User.find_by_email('user@localhost')).nil?
  u2 = User.create!(password: 'qwerty', password_confirmation: 'qwerty',
    email: 'user@localhost')
  u2.activate!
end
r1, r2 = Role.create_main_roles
ru1 = RoleUser.create(role: r1, user: u1)
ru2 = RoleUser.create(role: r2, user: u2)



ScholarshipPeriod.destroy_all; TypeScholarship.destroy_all; Order.destroy_all; Group.destroy_all; Faculty.destroy_all; Financing.destroy_all; Student.destroy_all; OrderLine.destroy_all; PerformDatum.destroy_all 
n = 10
for i in 0 ... n do
  ScholarshipPeriod.create(begin: Date.today, end: Date.today)
  TypeScholarship.create(name_financing: "name_financing" + i.to_s, typescholarship: "typescholarship" + i.to_s)
  Order.create(number: "number" + i.to_s)
  Group.create(numberg: "numberg" + i.to_s)
  Faculty.create(namef: "namef" + i.to_s)
  Financing.create(name_financing: "name_financing" + i.to_s, suum: "suum" + i.to_s)
  Student.create(fn: "fn" + i.to_s, sn: "sn" + i.to_s, ln: "ln" + i.to_s, birthday: "birthday"  + i.to_s, course: "course" + i.to_s)
  OrderLine.create(begin_date: Date.today, end_date: Date.today, scholarship: "scholarship" + i.to_s)
  PerformDatum.create(quantity5: "quantity5" + i.to_s, quantity4: "quantity4" + i.to_s, quantity3: "quantity3" + i.to_s, quantity2: "quantity2" + i.to_s) 
  
end

