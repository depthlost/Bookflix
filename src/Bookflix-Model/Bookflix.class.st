Class {
	#name : #Bookflix,
	#superclass : #Object,
	#classInstVars : [
		'instance'
	],
	#category : #'Bookflix-Model'
}

{ #category : #singleton }
Bookflix class >> clearInstance [
	instance := nil
]

{ #category : #singleton }
Bookflix class >> instance [
	^ instance ifNil: [ instance := Bookflix new ]
]

{ #category : #adding }
Bookflix >> addBook: aBook [
	"agrega un libro a la base de datos"

	
]

{ #category : #adding }
Bookflix >> addUser: aUser [
	"agrega un usuario a la base de datos"

	
]

{ #category : #'as yet unclassified' }
Bookflix >> getUserWithEmail: anEmail andPassword: aPassword [
	^ User selectAll
		detect: [ :user | user email = anEmail & (user password = aPassword) ]
		ifNone: [ nil ]
]

{ #category : #removing }
Bookflix >> removeBook: aBook [
	"borra el libro recivido como parametro de la base de datos si es que esta alli"

	
]
