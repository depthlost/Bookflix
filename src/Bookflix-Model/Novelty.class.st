Class {
	#name : #Novelty,
	#superclass : #Readable,
	#instVars : [
		'date',
		'videos',
		'photos'
	],
	#category : #'Bookflix-Model'
}

{ #category : #testing }
Novelty class >> isVoyageRoot [
	^ true
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
Novelty >> videos [
	^ videos
]
