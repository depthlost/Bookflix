Class {
	#name : #Novelty,
	#superclass : #Object,
	#instVars : [
		'date',
		'title',
		'description',
		'collection'
	],
	#category : #'Bookflix-Model'
}

{ #category : #testing }
Novelty class >> isVoyageRoot [
	^ true
]

{ #category : #'as yet unclassified' }
Novelty class >> title: aTitle description: aDescription collection: aCollection [
	^ self new
		title: aTitle
		description: aDescription
		collection: aCollection
]

{ #category : #accessing }
Novelty >> addCollection: aElement [
	collection add: aElement
]

{ #category : #accessing }
Novelty >> collection [
	^ collection
]

{ #category : #accessing }
Novelty >> collection: aCollection [
	collection := aCollection
]

{ #category : #accessing }
Novelty >> date [
	^ date
]

{ #category : #accessing }
Novelty >> date: aDateAndTime [
	date := aDateAndTime
]

{ #category : #accessing }
Novelty >> description [
	^ description
]

{ #category : #accessing }
Novelty >> description: aDescription [
	description := aDescription
]

{ #category : #initialization }
Novelty >> initialize [
	date := DateAndTime now.
	title := ''.
	description := ''.
	collection := OrderedCollection new
]

{ #category : #accessing }
Novelty >> title [
	^ title
]

{ #category : #accessing }
Novelty >> title: aTitle [
	title := aTitle
]

{ #category : #'as yet unclassified' }
Novelty >> title: aTitle description: aDescription collection: aCollection [
	title := aTitle.
	description := aDescription.
	collection := aDescription
]
