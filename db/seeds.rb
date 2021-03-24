# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Reservation.create(user_id:1,lesson_id:1)

Lesson.create(title:"Body Combat",level:3,category:"脂肪燃焼",started_at:"2021/02/19",description:"ボクシングの動きで脂肪燃焼燃焼を図る",price:0,instructor:"川下",limits:30)

User.create(name:"Guest1",point:0,birthday:"2000/01/21",address:"Osaka*********",sex:"male",email:"guest1@example.com",password:"password",password_confirmation:"password")
User.create(name:"Guest2",point:0,birthday:"2000/01/21",address:"Osaka*********",sex:"male",email:"guest2@example.com",password:"password",password_confirmation:"password")
User.create(name:"Guest3",point:0,birthday:"2000/01/21",address:"Osaka*********",sex:"male",email:"guest3@example.com",password:"password",password_confirmation:"password")
User.create(name:"Guest4",point:0,birthday:"2000/01/21",address:"Osaka*********",sex:"male",email:"guest4@example.com",password:"password",password_confirmation:"password")