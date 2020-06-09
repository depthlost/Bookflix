Class {
	#name : #Readable,
	#superclass : #Object,
	#instVars : [
		'title',
		'description'
	],
	#category : #'Bookflix-Model'
}

{ #category : #'as yet unclassified' }
Readable class >> title: aTitle description: aDescription [
	^ self new title: aTitle description: aDescription
]

{ #category : #accessing }
Readable >> description [
	^ description
]

{ #category : #accessing }
Readable >> description: aDescription [
	description := aDescription
]

{ #category : #accessing }
Readable >> title [
	^ title
]

{ #category : #initialization }
Readable >> title: aTitle [
	title := aTitle
]

{ #category : #initialization }
Readable >> title: aTitle description: aDescription [
	title := aTitle.
	description := aDescription
]
