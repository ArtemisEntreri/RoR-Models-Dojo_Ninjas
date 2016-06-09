1. rails new dojo_ninjas

2. rails g model Dojo name:string city:string state:string
   rails g model Ninja first_name:string last_name:string dojo:references

3. Dojo.create(name: "Dojo1")
   Dojo2 = Dojo.new
   Dojo2.save

4 and 5. 	class Dojo < ActiveRecord::Base
				has_many :ninjas
				validates :name, :city, :state, presence: true
				validates :state, length: {is: 2}
			end

			class Ninja < ActiveRecord::Base
  				belongs_to :dojo
  				validates :first_name, :last_name, presence: true
			end

6.	
	1.	Dojo.destroy_all

	2.	Dojo.new(name:"Seattle", city:"Bellevue", state:"WA").save
		CA = Dojo.new(name:"Silicon Valley", city:"Mountain View", state:"CA")
		CA.valid?
		CA.save
	3.	WA = Dojo.new(city:"Wenatchee", state:"WAS")
		ny.valid?
		ny.errors.full_messages
		Dojo.create(name:"Wenatchee Dojo", city:"Wenatchee", state:"WA")	

	4. 	Ninja.create(first_name: "Garett", last_name: "Entreri", dojo:Dojo.find(2))
		...
	5.	Ninja.create(first_name: "John", last_name: "Supsupin", dojo:Dojo.first)
		...
	6. 	Ninja.create(first_name: "Yuliya", last_name: "Papina", dojo:Dojo.last)
		...

	7. 	Dojo.find(2).ninjas.all
		Dojo.first.ninjas.all

	8.  Dojo.find(2).destroy

	8.2	dependent: :destroy

	9.  Dojo.find(2).ninjas.select(:first_name).order("created_at DESC")  