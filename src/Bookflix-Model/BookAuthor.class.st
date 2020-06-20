Class {
	#name : #BookAuthor,
	#superclass : #Searchable,
	#category : #'Bookflix-Model'
}

{ #category : #testing }
BookAuthor class >> isVoyageRoot [
	^ true
]

{ #category : #testing }
BookAuthor class >> name: aString [
	^ self new name: aString
]

{ #category : #initialization }
BookAuthor >> initialize [
	super initialize.
	name := 'anonimo'
]
