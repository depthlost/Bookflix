Class {
	#name : #Novelty,
	#superclass : #Readable,
	#instVars : [
		'content',
		'type'
	],
	#category : #'Bookflix-Model'
}

{ #category : #'as yet unclassified' }
Novelty class >> title: aTitle description: aDescription expirationDate: aDate saveAsPhoto: aContent [
	^ (self title: aTitle description: aDescription expirationDate: aDate)
		saveAsPhoto: aContent
]

{ #category : #'as yet unclassified' }
Novelty class >> title: aTitle description: aDescription expirationDate: aDate saveAsText: aContent [
	^ (self title: aTitle description: aDescription expirationDate: aDate)
		saveAsText: aContent
]

{ #category : #'as yet unclassified' }
Novelty class >> title: aTitle description: aDescription expirationDate: aDate saveAsVideo: aContent [
	^ (self title: aTitle description: aDescription expirationDate: aDate)
		saveAsVideo: aContent
]

{ #category : #'as yet unclassified' }
Novelty class >> title: aTitle description: aDescription saveAsPhoto: aContent [
	^ (self title: aTitle description: aDescription)
		saveAsPhoto: aContent
]

{ #category : #'as yet unclassified' }
Novelty class >> title: aTitle description: aDescription saveAsText: aContent [
	^ (self title: aTitle description: aDescription) saveAsText: aContent
]

{ #category : #'as yet unclassified' }
Novelty class >> title: aTitle description: aDescription saveAsVideo: aContent [
	^ (self title: aTitle description: aDescription)
		saveAsVideo: aContent
]

{ #category : #accessing }
Novelty >> content [
	^ content
]

{ #category : #initialization }
Novelty >> initialize [
	super initialize.
	content := ''.
	type := 'text'
]

{ #category : #testing }
Novelty >> isPhoto [
	^ type = 'photo'
]

{ #category : #testing }
Novelty >> isText [
	^ type = 'text'
]

{ #category : #testing }
Novelty >> isVideo [
	^ type = 'video'
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
