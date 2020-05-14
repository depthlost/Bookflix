Class {
	#name : #Editorial,
	#superclass : #Object,
	#instVars : [
		'name',
		'books'
	],
	#category : #'Bookflix-Model'
}

{ #category : #'instance creation' }
Editorial class >> newWithName: aName [
	^ self new name: aName
]

{ #category : #adding }
Editorial >> addBook: aBook [
	books add: aBook
]

{ #category : #adding }
Editorial >> initialize [
	books := OrderedCollection new
]

{ #category : #setting }
Editorial >> name: aName [
	name := aName
]
