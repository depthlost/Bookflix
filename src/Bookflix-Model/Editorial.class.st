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

{ #category : #'instance creation' }
Editorial class >> newOrExistingWithName: aName [
	self selectAll
		detect: [ :editorial | editorial haveName: aName ]
		ifFound: [ :editorial | ^ editorial ]
		ifNone: [ ^ self newWithName: aName ]
]

{ #category : #'instance creation' }
Editorial class >> newWithName: aName [
	^ self new name: aName
]

{ #category : #adding }
Editorial >> addBook: aBook [
	books add: aBook
]

{ #category : #'as yet unclassified' }
Editorial >> haveName: aName [
	^ name = aName
]

{ #category : #adding }
Editorial >> initialize [
	books := OrderedCollection new
]

{ #category : #accesing }
Editorial >> name [
	^ name
]

{ #category : #accesing }
Editorial >> name: aName [
	name := aName
]
