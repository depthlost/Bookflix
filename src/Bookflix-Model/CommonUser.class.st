Class {
	#name : #CommonUser,
	#superclass : #User,
	#instVars : [
		'card'
	],
	#category : #'Bookflix-Model'
}

{ #category : #'as yet unclassified' }
CommonUser class >> name: aName surname: aSurname email: anEmail password: aPassword birthdate: aBirthdate card: aCard [
	^ (self
		name: aName
		surname: aSurname
		email: anEmail
		password: aPassword
		birthdate: aBirthdate)
		card: aCard;
		yourself
]

{ #category : #accesing }
CommonUser >> card [
	^ card
]

{ #category : #setting }
CommonUser >> card: aCard [
	card := aCard
]

{ #category : #'as yet unclassified' }
CommonUser >> name: aName surname: aSurname email: anEmail password: aPassword birthdate: aBirthdate card: aCard [
	self
		name: aName
		surname: aSurname
		email: anEmail
		password: aPassword
		birthdate: aBirthdate.
	card := aCard
]

{ #category : #'as yet unclassified' }
CommonUser >> îsAdmin [
	^ false
]
