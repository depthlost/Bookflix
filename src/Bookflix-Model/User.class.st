Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'name',
		'surname',
		'email',
		'password',
		'birthdate'
	],
	#category : #'Bookflix-Model'
}

{ #category : #voyage }
User class >> isVoyageRoot [
	^ true
]

{ #category : #initialization }
User class >> name: aName surname: aSurname email: anEmail password: aPassword birthdate: aBirthdate [
	^ self new
		name: aName
		surname: aSurname
		email: anEmail
		password: aPassword
		birthdate: aBirthdate
]

{ #category : #accessing }
User >> birthdate [
	^ birthdate
]

{ #category : #accessing }
User >> birthdate: aBirthdate [
	birthdate := aBirthdate
]

{ #category : #accessing }
User >> email [
	^ email
]

{ #category : #accessing }
User >> email: anEmail [
	(self emailIsValid: anEmail)
		ifTrue: [ email := anEmail.
			^ true ].
	^ false
]

{ #category : #'as yet unclassified' }
User >> emailIsValid: aEmail [
	^ (aEmail includesSubstring: '@')
		& (aEmail includesSubstring: '.com')
]

{ #category : #abstract }
User >> isAdmin [
	^ false
]

{ #category : #accessing }
User >> name [
	^ name
]

{ #category : #accessing }
User >> name: aName [
	name := aName
]

{ #category : #initialization }
User >> name: aName surname: aSurname email: anEmail password: aPassword birthdate: aBirthdate [
	name := aName.
	surname := aSurname.
	email := anEmail.
	password := aPassword.
	birthdate := aBirthdate
]

{ #category : #accessing }
User >> password [
	^ password
]

{ #category : #accessing }
User >> password: aPassword [
	password := aPassword
]

{ #category : #accessing }
User >> surname [
	^ surname
]

{ #category : #accessing }
User >> surname: asurname [
	surname := surname
]
