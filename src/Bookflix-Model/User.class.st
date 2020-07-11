Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'name',
		'surname',
		'email',
		'password',
		'birthdate',
		'profiles',
		'isPremium',
		'registrationDate'
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

{ #category : #'as yet unclassified' }
User >> addProfile: aProfile [
	profiles add: aProfile
]

{ #category : #accessing }
User >> birthdate [
	^ birthdate
]

{ #category : #accessing }
User >> birthdate: aBirthdate [
	birthdate := aBirthdate
]

{ #category : #testing }
User >> canAddProfile [
	self haveMaxProfiles
		ifTrue: [ ^ false ].
	^ true
]

{ #category : #testing }
User >> canNotPremium [
	^ profiles size <= 2
]

{ #category : #testing }
User >> canRemoveProfile [
	^ profiles size > 1
]

{ #category : #accessing }
User >> email [
	^ email
]

{ #category : #accessing }
User >> email: anEmail [
	email := anEmail
]

{ #category : #'as yet unclassified' }
User >> haveMaxProfiles [
	self isPremium
		ifTrue: [ ^ profiles size >= 4 ].
	^ profiles size >= 2
]

{ #category : #initialization }
User >> initialize [
	name := 'nombre por defecto'.
	surname := 'apellido por defecto'.
	email := ''.
	password := ''.
	birthdate := Date today.
	profiles := Set new.
	isPremium := false.
	registrationDate := Date today
]

{ #category : #abstract }
User >> isAdmin [
	^ false
]

{ #category : #accessing }
User >> isPremium [
	^ isPremium
]

{ #category : #accessing }
User >> isPremium: aBool [
	isPremium := aBool
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
	birthdate := aBirthdate.
	self addProfile: (Profile name: name)
]

{ #category : #accessing }
User >> password [
	^ password
]

{ #category : #accessing }
User >> password: aPassword [
	password := aPassword
]

{ #category : #'as yet unclassified' }
User >> profiles [
	^ profiles
]

{ #category : #accessing }
User >> registrationDate [
	^ registrationDate
]

{ #category : #accessing }
User >> removeProfile: aProfile [
	(profiles includes: aProfile)
		ifFalse: [ ^ self ].
	profiles remove: aProfile.
	self save
]

{ #category : #accessing }
User >> surname [
	^ surname
]

{ #category : #accessing }
User >> surname: aSurname [
	surname := aSurname
]
