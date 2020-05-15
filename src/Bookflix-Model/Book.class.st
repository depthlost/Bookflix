Class {
	#name : #Book,
	#superclass : #Object,
	#instVars : [
		'title',
		'ISBN',
		'description',
		'imageURL',
		'author',
		'editorial',
		'genders'
	],
	#category : #'Bookflix-Model'
}

{ #category : #'instance creation' }
Book class >> newWithTitle: aTitle ISBN: aISBN description: aDescription imageURL: aImageURL author: aAuthor editorial: aEditorial [
	^ self new
		title: aTitle
			ISBN: aISBN
			description: aDescription
			imageURL: aImageURL
			author: aAuthor
			editorial: aEditorial;
		yourself
]

{ #category : #adding }
Book >> addGender: aGender [
	genders add: aGender
]

{ #category : #initialization }
Book >> initialize [
	genders := OrderedCollection new
]

{ #category : #setting }
Book >> title: aTitle ISBN: aISBN description: aDescription imageURL: aImageURL author: aAuthor editorial: aEditorial [
	title := aTitle.
	ISBN := aISBN.
	description := aDescription.
	imageURL := aImageURL.
	author := aAuthor.
	editorial := aEditorial
]
