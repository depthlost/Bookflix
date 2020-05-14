Class {
	#name : #BookAuthor,
	#superclass : #Object,
	#instVars : [
		'name',
		'surname',
		'books'
	],
	#category : #'Bookflix-Model'
}

{ #category : #'instance creation' }
BookAuthor class >> newWithName: aName surname: aSurname [
	^ self new name: aName surname: aSurname
]

{ #category : #adding }
BookAuthor >> addBook: aBook [
	books add: aBook
]

{ #category : #initialization }
BookAuthor >> initialize [
	books := OrderedCollection new
]

{ #category : #setting }
BookAuthor >> name: aName surname: aSurname [
	name := aName.
	surname := aSurname
]
