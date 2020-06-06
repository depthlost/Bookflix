Class {
	#name : #Advance,
	#superclass : #Object,
	#instVars : [
		'book',
		'content'
	],
	#category : #'Bookflix-Model'
}

{ #category : #accessing }
Advance class >> content: aContent book: aBook [
	^ self new content: aContent book: aBook
]

{ #category : #testing }
Advance class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
Advance >> book: aBook [
	book := aBook
]

{ #category : #accessing }
Advance >> content [
	^ content
]

{ #category : #accessing }
Advance >> content: aContent [
	content := aContent
]

{ #category : #accessing }
Advance >> content: aContent book: aBook [
	self content: aContent.
	self book: aBook
]
