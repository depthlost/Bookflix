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

{ #category : #testing }
BookAuthor class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
BookAuthor class >> newOrExistingWithName: aName surname: aSurname [
	self selectAll
		detect: [ :author | author haveName: aName andSurname: aSurname ]
		ifFound: [ :author | ^ author ]
		ifNone: [ ^ self newWithName: aName surname: aSurname ]
]

{ #category : #'instance creation' }
BookAuthor class >> newWithName: aName surname: aSurname [
	^ self new name: aName surname: aSurname
]

{ #category : #adding }
BookAuthor >> addBook: aBook [
	books add: aBook
]

{ #category : #'as yet unclassified' }
BookAuthor >> haveName: aName andSurname: aSurname [
	^ aName = name & (aSurname = surname)
]

{ #category : #initialization }
BookAuthor >> initialize [
	books := OrderedCollection new
]

{ #category : #accesing }
BookAuthor >> name [
	^ name
]

{ #category : #accesing }
BookAuthor >> name: aName [
	name := aName
]

{ #category : #setting }
BookAuthor >> name: aName surname: aSurname [
	name := aName.
	surname := aSurname
]

{ #category : #accesing }
BookAuthor >> surname [
	^ surname
]

{ #category : #accesing }
BookAuthor >> surname: aSurname [
	surname := aSurname
]
