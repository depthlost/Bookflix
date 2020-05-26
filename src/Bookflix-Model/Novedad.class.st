Class {
	#name : #Novedad,
	#superclass : #Object,
	#instVars : [
		'date',
		'title',
		'description',
		'collection'
	],
	#category : #'Bookflix-Model'
}

{ #category : #'as yet unclassified' }
Novedad class >> title: aTitle description: aDescription collection: aCollection [
	^ self new
		title: aTitle
		description: aDescription
		collection: aCollection
]

{ #category : #accessing }
Novedad >> addCollection: aElement [
	collection add: aElement
]

{ #category : #accessing }
Novedad >> collection [
	^ collection
]

{ #category : #accessing }
Novedad >> collection: aCollection [
	collection := aCollection
]

{ #category : #accessing }
Novedad >> date [
	^ date
]

{ #category : #accessing }
Novedad >> date: aDateAndTime [
	date := aDateAndTime
]

{ #category : #accessing }
Novedad >> description [
	^ description
]

{ #category : #accessing }
Novedad >> description: aDescription [
	description := aDescription
]

{ #category : #initialization }
Novedad >> initialize [
	date := DateAndTime now.
	title := ''.
	description := ''.
	collection := OrderedCollection new
]

{ #category : #accessing }
Novedad >> title [
	^ title
]

{ #category : #accessing }
Novedad >> title: aTitle [
	title := aTitle
]

{ #category : #'as yet unclassified' }
Novedad >> title: aTitle description: aDescription collection: aCollection [
	title := aTitle.
	description := aDescription.
	collection := aDescription
]
