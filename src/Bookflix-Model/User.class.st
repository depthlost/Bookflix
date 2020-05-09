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
User >> email [
	^ email
]

{ #category : #abstract }
User >> isAdmin [
	^ self subclassResponsibility
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
