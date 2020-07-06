Class {
	#name : #UserSample,
	#superclass : #Object,
	#category : #'Bookflix-Model-Samples'
}

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
