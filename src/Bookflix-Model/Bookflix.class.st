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

{ #category : #'as yet unclassified' }
Bookflix >> existUserWithEmail: anEmail [
	^ User selectAll anySatisfy: [ :user | user email = anEmail ]
]

{ #category : #'as yet unclassified' }
Bookflix >> existingIsbn: aIsbn [
	| books |
	books := self getAllBooks.
	^ books anySatisfy: [ :book | book isbn = aIsbn ]
]

{ #category : #'as yet unclassified' }
Bookflix >> getAllBooks [
	^ Book selectAll
]

{ #category : #'as yet unclassified' }
Bookflix >> getUserWithEmail: anEmail andPassword: aPassword [
	^ User selectAll
		detect: [ :user | user email = anEmail & (user password = aPassword) ]
		ifNone: [ nil ]
]
