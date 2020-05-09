Class {
	#name : #TestCommonUser,
	#superclass : #TestCase,
	#instVars : [
		'user'
	],
	#category : #'Bookflix-Tests'
}

{ #category : #running }
TestCommonUser >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	user := CommonUser
		name: 'Jhon'
		surname: 'Commun'
		email: 'jhonIsCommon@gmail.com'
		password: '7dragonComun'
		birthdate: Date today
		card:
			(Card
				name: 'Jhon'
				surname: 'Commun'
				number: 231234
				expirationDate: Date today
				securityCode: 23132)
]
