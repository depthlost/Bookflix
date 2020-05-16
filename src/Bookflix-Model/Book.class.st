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

{ #category : #testing }
Book class >> isVoyageRoot [
	^ true
]

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
	genders add: aGender.
	aGender addBook: self
]

{ #category : #adding }
Book >> addGenders: aGenders [
	| col |
	col := aGenders findTokens: ','.
	col := col
		collect: [ :nomGender | Gender newOrExistingWithName: nomGender ].
	genders := col
]

{ #category : #accessing }
Book >> description [
	^ description
]

{ #category : #accessing }
Book >> genders [
	^ genders
]

{ #category : #accessing }
Book >> imageURL [
	^ imageURL
]

{ #category : #initialization }
Book >> initialize [
	genders := OrderedCollection new
]

{ #category : #accessing }
Book >> title [
	^ title
]

{ #category : #setting }
Book >> title: aTitle ISBN: aISBN description: aDescription imageURL: aImageURL author: aAuthor editorial: aEditorial [
	title := aTitle.
	ISBN := aISBN.
	description := aDescription.
	imageURL := aImageURL.
	author := aAuthor.
	aAuthor addBook: self.
	editorial := aEditorial.
	aEditorial addBook: self
]
