Class {
	#name : #Readable,
	#superclass : #Object,
	#instVars : [
		'title'
	],
	#category : #'Bookflix-Model'
}

{ #category : #'as yet unclassified' }
Readable class >> title: aTitle [
	^ self new title: aTitle
]

{ #category : #accessing }
Readable >> title [
	^ title
]

{ #category : #initialization }
Readable >> title: aTitle [
	title := aTitle
]
