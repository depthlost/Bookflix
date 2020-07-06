Class {
	#name : #AuthorSample,
	#superclass : #Object,
	#category : #'Bookflix-Model-Samples'
}

{ #category : #adding }
AuthorSample class >> addAuthor1 [
	Bookflix instance addAuthor: 'Cliff Wright'
]

{ #category : #adding }
AuthorSample class >> addAuthor2 [
	Bookflix instance addAuthor: 'Yuval Zommer'
]

{ #category : #adding }
AuthorSample class >> addAuthor3 [
	Bookflix instance addAuthor: 'Enid Blyton'
]
