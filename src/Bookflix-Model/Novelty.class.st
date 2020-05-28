Class {
	#name : #Novelty,
	#superclass : #Object,
	#instVars : [
		'date',
		'title',
		'description',
		'videos',
		'photos'
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

{ #category : #adding }
Novelty >> addPhoto: aPhoto [
	photos add: aPhoto
]

{ #category : #adding }
Novelty >> addVideo: aVideo [
	videos add: aVideo
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
	videos := OrderedCollection new.
	photos := OrderedCollection new
]

{ #category : #accessing }
Novelty >> photos [
	^ photos
]

{ #category : #accessing }
Novelty >> title [
	^ title
]

{ #category : #accessing }
Novelty >> title: aTitle [
	title := aTitle
]

{ #category : #initialization }
Novelty >> title: aTitle description: aDescription [
	title := aTitle.
	description := aDescription
]

{ #category : #accessing }
Novelty >> videos [
	^ videos
]
