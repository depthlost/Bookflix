Class {
	#name : #Gender,
	#superclass : #Object,
	#instVars : [
		'name',
		'books'
	],
	#category : #'Bookflix-Model'
}

{ #category : #testing }
Gender class >> isVoyageRoot [
	^ true
]

{ #category : #construction }
Gender class >> name: aName [
	^ self new name: aName
]

{ #category : #'instance creation' }
Gender class >> newOrExistingWithName: aName [
	self selectAll
		detect: [ :gender | gender haveName: aName ]
		ifFound: [ :gender | ^ gender ]
		ifNone: [ ^ self newWithName: aName ]
]

{ #category : #'instance creation' }
Gender class >> newWithName: aName [
	^ self new name: aName
]

{ #category : #adding }
Gender >> addBook: aBook [
	books add: aBook
]

{ #category : #'as yet unclassified' }
Gender >> haveName: aName [
	^ name = aName
]

{ #category : #initialization }
Gender >> initialize [
	books := OrderedCollection new
]

{ #category : #setting }
Gender >> name: aName [
	name := aName
]
