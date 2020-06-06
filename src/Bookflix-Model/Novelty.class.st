Class {
	#name : #Novelty,
	#superclass : #Readable,
	#instVars : [
		'date',
		'content',
		'type'
	],
	#category : #'Bookflix-Model'
}

{ #category : #testing }
Novelty class >> isVoyageRoot [
	^ true
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
	content := ''.
	type := 'text'
]

{ #category : #'as yet unclassified' }
Novelty >> saveAsPhoto: aPhoto [
	content := aPhoto.
	type := 'photo'
]

{ #category : #'as yet unclassified' }
Novelty >> saveAsText: aText [
	content := aText.
	type := 'text'
]

{ #category : #'as yet unclassified' }
Novelty >> saveAsVideo: aVideo [
	content := aVideo.
	type := 'video'
]

{ #category : #accessing }
Novelty >> type [
	"devuelve en un string el tipo de deato del contenido, sean las opciones text-photo-video"

	^ type
]
