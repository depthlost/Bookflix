Class {
	#name : #Searchable,
	#superclass : #Object,
	#instVars : [
		'name',
		'books'
	],
	#category : #'Bookflix-Model'
}

{ #category : #adding }
Searchable >> addBook: aBook [
	books add: aBook
]

{ #category : #initialization }
Searchable >> initialize [
	name := ''.
	books := Set new
]

{ #category : #accessing }
Searchable >> name [
	^ name
]

{ #category : #accessing }
Searchable >> name: aString [
	name := aString
]

{ #category : #removing }
Searchable >> removeBook: aBook [
	books remove: aBook
]
