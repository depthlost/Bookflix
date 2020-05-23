Class {
	#name : #Book,
	#superclass : #Object,
	#instVars : [
		'title',
		'isbn',
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
Book class >> newWithTitle: aTitle isbn: aISBN description: aDescription imageURL: aImageURL author: aAuthor editorial: aEditorial genders: aGenders [
	^ self new
		title: aTitle
			isbn: aISBN
			description: aDescription
			imageURL: aImageURL
			author: aAuthor
			editorial: aEditorial
			genders: aGenders;
		yourself
]

{ #category : #accessing }
Book >> author [
	^ author
]

{ #category : #accessing }
Book >> author: aAuthor [
	author := aAuthor
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
	genders := aGenders
]

{ #category : #accessing }
Book >> imageURL [
	^ imageURL
]

{ #category : #accessing }
Book >> imageURL: aImageURL [
	imageURL := aImageURL
]

{ #category : #accessing }
Book >> isbn [
	^ isbn
]

{ #category : #accessing }
Book >> isbn: aISBN [
	isbn := aISBN
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
Book >> title: aTitle isbn: aISBN description: aDescription imageURL: aImageURL author: aAuthor editorial: aEditorial genders: aGenders [
	title := aTitle.
	isbn := aISBN.
	description := aDescription.
	imageURL := aImageURL.
	author := aAuthor.
	editorial := aEditorial.
	genders := aGenders
]
