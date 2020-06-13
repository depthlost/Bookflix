Class {
	#name : #CompleteBook,
	#superclass : #Book,
	#instVars : [
		'content'
	],
	#category : #'Bookflix-Model'
}

{ #category : #'instance creation' }
CompleteBook class >> newWithTitle: aTitle isbn: aISBN description: aDescription imageURL: aImageURL author: aAuthor editorial: aEditorial content: aContent [
	^ (self
		newWithTitle: aTitle
		isbn: aISBN
		description: aDescription
		imageURL: aImageURL
		author: aAuthor
		editorial: aEditorial)
		content: aContent;
		yourself
]

{ #category : #'instance creation' }
CompleteBook class >> newWithTitle: aTitle isbn: aISBN description: aDescription imageURL: aImageURL author: aAuthor editorial: aEditorial content: aContent expirationDate: aDate [
	^ (self
		newWithTitle: aTitle
		isbn: aISBN
		description: aDescription
		imageURL: aImageURL
		author: aAuthor
		editorial: aEditorial
		expirationDate: aDate)
		content: aContent;
		yourself
]

{ #category : #accessing }
CompleteBook >> content [
	^ content
]

{ #category : #accessing }
CompleteBook >> content: aContent [
	content := aContent.
]
