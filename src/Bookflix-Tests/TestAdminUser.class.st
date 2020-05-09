Class {
	#name : #TestAdminUser,
	#superclass : #TestCase,
	#instVars : [
		'user'
	],
	#category : #'Bookflix-Tests'
}

{ #category : #running }
TestAdminUser >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	user := CommonUser
		name: 'Jhon'
		surname: 'Admin'
		email: 'jhonIsAdmin@gmail.com'
		password: '7dragonAdmin'
		birthdate: Date today
]
