Class {
	#name : #Gender,
	#superclass : #Object,
	#instVars : [
		'name',
		'books'
	],
	#category : #'Bookflix-Model'
}

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
