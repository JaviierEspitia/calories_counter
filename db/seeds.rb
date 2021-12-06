# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

tipo = "" #Inicializo variable solo como para que no haya basura

for i in 1..10
    User.create(email: Faker::Internet.email, name: Faker::Name.first_name , password: "hogaru", password_confirmation: "hogaru")
end

for j in 1..10
    (4.months.ago.to_date..Date.current).each do |date|
        calorias = rand(500)
        bandera = rand(2)
        if bandera == 1
            tipo = "Ingested"
        else
            tipo = "Burned"
        end  
    Calorie.create(day:date , quantity_calories: calorias, kind: tipo , user_id: j, comment: Faker::Movie.title)
    end
end