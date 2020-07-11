Class {
	#name : #HistorialElemnt,
	#superclass : #Object,
	#instVars : [
		'book',
		'moment',
		'finish'
	],
	#category : #'Bookflix-Model'
}

{ #category : #accessing }
HistorialElemnt class >> book: aBook [
	^ self new book: aBook
]

{ #category : #accessing }
HistorialElemnt >> book [
	^ book
]

{ #category : #accessing }
HistorialElemnt >> book: aBook [
	book := aBook
]

{ #category : #accessing }
HistorialElemnt >> initialize [
	book := nil.
	moment := DateAndTime now.
	finish := false
]

{ #category : #'as yet unclassified' }
HistorialElemnt >> updateMoment [
	moment := DateAndTime now
]
