require 'colorize'
User.create(email: "teste@teste.com", password: "teste") 
puts "#{User.count} usuário cadastrado".green
Person.create(name: "Justin", last_name: "Timberlake", document: "79877842068", birth_date: "02/12/2005", email: "justin@email.com")
Person.create(name: "Angelina", last_name: "Jolie", document: "17568397009", birth_date: "31/05/1977", email: "angelina@email.com")
Person.create(name: "Beyoncé", last_name: "", document: "25408438082", birth_date: "07/08/1986", email: "beyoncé@email.com")
Person.create(name: "Brad", last_name: "Pitt", document: "87839967027", birth_date: "16/05/1971", email: "brad@email.com")
Person.create(name: "Tom", last_name: "Cruise", document: "36031680033", birth_date: "07/02/1948", email: "tom@email.com")
Person.create(name: "Gisele", last_name: "Bündchen", document: "33888115043", birth_date: "26/02/1962", email: "gisele@email.com")
Person.create(name: "Will", last_name: "Smith", document: "80050339079", birth_date: "12/01/1987", email: "will@email.com")
puts "#{Person.count} pessoas cadastradas".green
Phone.create(person_id: 1, ddd: "11", number: "79877842", kind: "comercial")
Phone.create(person_id: 2, ddd: "21", number: "17568397", kind: "particular")
Phone.create(person_id: 3, ddd: "45", number: "25408438", kind: "trabalho")
Phone.create(person_id: 4, ddd: "36", number: "987839967", kind: "particular")
Phone.create(person_id: 5, ddd: "22", number: "36031680", kind: "comercial")
Phone.create(person_id: 6, ddd: "32", number: "33888115", kind: "particular")
Phone.create(person_id: 7, ddd: "11", number: "980050339", kind: "trabalho")
puts "#{Phone.count} telefones cadastrados".green
Person.all.each do |person|
	person.set_preferred_phone
end
puts "Preferenciais atualizados".green
Automobile.create(model: "CB 300", color: "vermelho", kind: "moto", license_plate: "AHD-5454", cost: 99.99)
Automobile.create(model: "HB 300", color: "preto", kind: "carro", license_plate: "FMR-6345", cost: 139.99)
Automobile.create(model: "Agrale 6500", color: "prata", kind: "VUC", license_plate: "RGH-4245", cost: 199.99)
Automobile.create(model: "Millennium III", color: "azul", kind: "ônibus", license_plate: "BTF-5278", cost: 279.99)
Automobile.create(model: "Atego 2425", color: "branco", kind: "caminhão", license_plate: "BYT-2354", cost: 409.99)
puts "#{Automobile.count} Automóveis cadastrados".green
Modality.create(category: "Categoria A", description: "Veículo motorizado de duas ou três rodas, com ou sem carro lateral. Ex.: Motocicleta, Ciclomotor, Motoneta ou Triciclo;")
Modality.create(category: "Categoria B", description: "Veículos cujo peso bruto total não exceda a 3500 kg ou cuja lotação não exceda 8 lugares, excluído o do motorista. Ex.: Automóvel, caminhonete, camioneta, utilitário.")
Modality.create(category: "Categoria C", description: "Veículos utilizados no transporte de carga e que exceda os 3500 kg. Ex: Caminhão.")
Modality.create(category: "Categoria D", description: "Veículos utilizados no transporte de passageiros, cuja lotação exceda a 08 passageiros, excluindo o motorista. Ex: Micro-ônibus, Ônibus.")
Modality.create(category: "Categoria E", description: "Todos os veículos das categorias B, C ou D e cuja unidade acoplada, reboque, semi reboque, trailer ou articulada tenha 6.000 kg ou mais de peso bruto total, ou cuja lotação exceda a 8 lugares. Condutor de combinação de veículos com mais de uma unidade tracionada, independentemente da capacidade de tração ou do peso bruto total. Ex.: Veículo com dois reboques acoplados.")
Modality.create(category: "Categoria ACC", description: "Veículos de duas ou três rodas com potência de até 50 cilindradas. Ex: Ciclomotores.")
puts "#{Modality.count} Modalidades cadastradas".green
License.create(person_id: 1, number: 7195601426, modalities_ids: [1,2], expiration: "02/12/2013")
License.create(person_id: 2, number: 6943716123, modalities_ids: [1,3], expiration: "02/12/2013")
License.create(person_id: 3, number: 1180791711, modalities_ids: [2], expiration: "02/12/2013")
License.create(person_id: 4, number: 4022223573, modalities_ids: [5], expiration: "02/12/2013")
License.create(person_id: 5, number: 4792176902, modalities_ids: [4], expiration: "02/12/2013")
License.create(person_id: 6, number: 1910131222, modalities_ids: [1,2], expiration: "02/12/2013")
License.create(person_id: 7, number: 6892136432, modalities_ids: [1], expiration: "02/12/2013")
puts "#{License.count} Habilitações cadastradas".green
Rent.create(person_id: 2, automobile_id: 2, cost: 199.98, start_date: "07/11/2019", end_date: "09/11/2019", pickup_date: "07/11/20198", delivery_date: "09/11/2019")
Rent.create(person_id: 4, automobile_id: 3, cost: 399.98, start_date: "07/11/2019", end_date: "09/11/2019", pickup_date: "07/11/20198", delivery_date: "09/11/2019")
puts "#{Rent.count} Locações cadastradas".green