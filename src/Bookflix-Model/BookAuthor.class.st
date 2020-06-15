Class {
	#name : #BookAuthor,
	#superclass : #Object,
	#instVars : [
		'name',
		'books'
	],
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

{ #category : #adding }
BookAuthor >> addBook: aBook [
	books add: aBook
]

{ #category : #initialization }
BookAuthor >> initialize [
	name := 'anonimo'.
	books := Set new
]

{ #category : #accessing }
BookAuthor >> name [
	^ name
]

{ #category : #accessing }
BookAuthor >> name: anAuthor [
	name := anAuthor
]
