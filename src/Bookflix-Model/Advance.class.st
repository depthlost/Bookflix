Class {
	#name : #Advance,
	#superclass : #Readable,
	#instVars : [
		'book',
		'content'
	],
	#category : #'Bookflix-Model'
}

{ #category : #accessing }
Advance class >> title: aTitle description: aDescription content: aContent [
	^ (self title: aTitle description: aDescription) content: aContent
]

{ #category : #accessing }
Advance class >> title: aTitle description: aDescription expirationDate: aDate content: aContent [
	^ (self title: aTitle description: aDescription expirationDate: aDate)
		content: aContent
]

{ #category : #accessing }
Advance >> book [
	^ book
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

{ #category : #initialization }
Advance >> initialize [
	super initialize.
	book := nil.
	content := nil
]
