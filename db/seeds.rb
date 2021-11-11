# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
fecha = Date.new(2021,07,01)
tipo = ""
123.times do |i|
    calorias = rand(400)
    bandera = rand(2)
    if bandera == 1
        tipo = "Ingested"
    else
        tipo = "Burned"
    end        
    Calorie.create(day:fecha+i , quantity_calories: calorias, kind: tipo , user_id: 3, comment: "Comment #{i}")
end
