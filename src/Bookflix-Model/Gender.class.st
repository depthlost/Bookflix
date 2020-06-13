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

{ #category : #accessing }
Gender class >> name: aString [
	^ self new name: aString
]

{ #category : #adding }
Gender >> addBook: aBook [
	books add: aBook
]

{ #category : #initialization }
Gender >> initialize [
	name := 'ninguno'.
	books := Set new
]

{ #category : #accessing }
Gender >> name [
	^ name
]

{ #category : #accessing }
Gender >> name: aString [
	name := aString
]
