Class {
	#name : #UserSample,
	#superclass : #Object,
	#category : #'Bookflix-Model-Samples'
}

{ #category : #adding }
UserSample class >> addIvan [
	(CommonUser
		name: 'Ivan'
		surname: 'Gomez'
		email: 'ivan@gmail.com'
		password: 'ivan123'
		birthdate: (Date year: 1992 month: 8 day: 20)
		card:
			(Card
				titular: 'Ivan Gomez'
				type: 'Credito'
				number: '1234123412341234'
				expirationDate: (Month year: 2020 month: 10)
				securityCode: '660')) save
]

{ #category : #adding }
UserSample class >> addJulian [
	(AdminUser
		name: 'Julian'
		surname: 'Lopez'
		email: 'julian@gmail.com'
		password: 'julian123'
		birthdate: (Date year: 1980 month: 6 day: 20)) save
]

{ #category : #adding }
UserSample class >> addLisa [
	(CommonUser
		name: 'Lisa'
		surname: 'Stanus'
		email: 'lisa@gmail.com'
		password: 'lisa123'
		birthdate: (Date year: 1990 month: 4 day: 12)
		card:
			(Card
				titular: 'Lisa Stanus'
				type: 'Debito'
				number: '1234123412341234'
				expirationDate: (Month year: 2022 month: 9)
				securityCode: '123')) save
]

{ #category : #adding }
UserSample class >> addMaria [
	(CommonUser
		name: 'Maria'
		surname: 'Alvarez'
		email: 'maria@gmail.com'
		password: 'maria123'
		birthdate: (Date year: 2000 month: 4 day: 22)
		card:
			(Card
				titular: 'Maria Alvarez'
				type: 'Credito'
				number: '1234123412341234'
				expirationDate: (Month year: 2022 month: 4)
				securityCode: '440')) save
]

{ #category : #adding }
UserSample class >> addUsers [
	self
		addJulian;
		addLisa;
		addIvan;
		addMaria
]
