Class {
	#name : #CompleteBook,
	#superclass : #Book,
	#instVars : [
		'content'
	],
	#category : #'Bookflix-Model'
}

{ #category : #'instance creation' }
CompleteBook class >> newWithTitle: aTitle isbn: aISBN description: aDescription imageURL: aImageURL author: aAuthor editorial: aEditorial content: aContent genders: aGenders [
	^ (self
		newWithTitle: aTitle
		isbn: aISBN
		description: aDescription
		imageURL: aImageURL
		author: aAuthor
		editorial: aEditorial
		genders: aGenders)
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
