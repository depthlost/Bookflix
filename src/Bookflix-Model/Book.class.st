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

{ #category : #accessing }
Book >> ISBN [
	^ ISBN
]

{ #category : #accessing }
Book >> ISBN: aISBN [
	ISBN := aISBN
]

{ #category : #adding }
Book >> addGender: aGender [
	(genders includes: aGender)
		ifTrue: [ ^ self ].
	genders add: aGender.
	aGender addBook: self
]

{ #category : #adding }
Book >> addGenders: aGenders [
	| col |
	col := aGenders findTokens: ','.
	col := col
		collect: [ :nomGender | Gender newOrExistingWithName: nomGender ].
	col do: [ :gender | self addGender: gender ]
]

{ #category : #accessing }
Book >> author [
	^ author
]

{ #category : #accessing }
Book >> description [
	^ description
]

{ #category : #accessing }
Book >> description: aDescription [
	description := aDescription
]

{ #category : #accessing }
Book >> editorial [
	^ editorial
]

{ #category : #accessing }
Book >> editorial: aEditorial [
	editorial := aEditorial
]

{ #category : #accessing }
Book >> genders [
	^ genders
]

{ #category : #accessing }
Book >> genders: aGenders [
	| col |
	col := aGenders findTokens: ','.
	col := col
		collect: [ :nomGender | Gender newOrExistingWithName: nomGender ].
	genders := col do: [ :gender | self addGender: gender ]
	"y aca borraria de la base de datos todos generos que no apunten a nada"
]

{ #category : #accessing }
Book >> gendersHowString [
	^ self
]

{ #category : #accessing }
Book >> imageURL [
	^ imageURL
]

{ #category : #accessing }
Book >> imageURL: aImageURL [
	imageURL := aImageURL
]

{ #category : #initialization }
Book >> initialize [
	genders := OrderedCollection new
]

{ #category : #accessing }
Book >> title [
	^ title
]

{ #category : #accessing }
Book >> title: aTitle [
	title := aTitle
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
