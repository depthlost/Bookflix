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

{ #category : #adding }
AuthorSample class >> addAuthor4 [
	Bookflix instance addAuthor: 'Juan Ramón Jiménez'
]

{ #category : #adding }
AuthorSample class >> addAuthors [
	self
		addAuthor1;
		addAuthor2;
		addAuthor3;
		addAuthor4
]
