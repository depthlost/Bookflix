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

{ #category : #adding }
Gender >> addBook: aBook [
	books add: aBook
]

{ #category : #initialization }
Gender >> initialize [
	books := OrderedCollection new
]

{ #category : #setting }
Gender >> name: aName [
	name := aName
]
