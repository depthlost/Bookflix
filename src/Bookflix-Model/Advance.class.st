Class {
	#name : #Advance,
	#superclass : #Readable,
	#instVars : [
		'book',
		'content'
	],
	#category : #'Bookflix-Model'
}

{ #category : #testing }
Advance class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
Advance class >> title: aTitle description: aDescription content: aContent book: aBook [
	^ (self title: aTitle description: aDescription)
		content: aContent
		book: aBook
]

{ #category : #accessing }
Advance class >> title: aTitle description: aDescription expirationDate: aDate content: aContent book: aBook [
	^ (self title: aTitle description: aDescription expirationDate: aDate)
		content: aContent
		book: aBook
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
Advance >> content: aPdf [
	content := aPdf
]

{ #category : #accessing }
Advance >> content: aContent book: aBook [
	self content: aContent.
	self book: aBook
]

{ #category : #initialization }
Advance >> initialize [
	super initialize.
	book := nil.
	content := nil
]
