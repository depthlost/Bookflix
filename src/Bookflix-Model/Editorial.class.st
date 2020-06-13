Class {
	#name : #Editorial,
	#superclass : #Object,
	#instVars : [
		'name',
		'books'
	],
	#category : #'Bookflix-Model'
}

{ #category : #testing }
Editorial class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
Editorial class >> name: aString [
	^ self new name: aString
]

{ #category : #adding }
Editorial >> addBook: aBook [
	books add: aBook
]

{ #category : #initialization }
Editorial >> initialize [
	name := 'anonima'.
	books := Set new
]

{ #category : #accessing }
Editorial >> name [
	^ name
]

{ #category : #accessing }
Editorial >> name: aString [
	name := aString
]
