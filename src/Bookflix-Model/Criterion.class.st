Class {
	#name : #Criterion,
	#superclass : #Searchable,
	#instVars : [
		'books'
	],
	#category : #'Bookflix-Model'
}

{ #category : #adding }
Criterion >> addBook: aBook [
	books add: aBook
]

{ #category : #accessing }
Criterion >> books [
	^ books
]

{ #category : #initialization }
Criterion >> initialize [
	super initialize.
	books := Set new
]

{ #category : #removing }
Criterion >> removeBook: aBook [
	books remove: aBook
]
