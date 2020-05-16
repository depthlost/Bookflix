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
Book class >> newWithTitle: aTitle ISBN: aISBN description: aDescription imageURL: aImageURL author: aAuthor editorial: aEditorial genders: aGenders [
	^ self new
		title: aTitle
			ISBN: aISBN
			description: aDescription
			imageURL: aImageURL
			author: aAuthor
			editorial: aEditorial
			genders: aGenders;
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
Book >> title [
	^ title
]

{ #category : #accessing }
Book >> title: aTitle [
	title := aTitle
]

{ #category : #setting }
Book >> title: aTitle ISBN: aISBN description: aDescription imageURL: aImageURL author: aAuthor editorial: aEditorial genders: aGenders [
	title := aTitle.
	ISBN := aISBN.
	description := aDescription.
	imageURL := aImageURL.
	author := aAuthor.
	editorial := aEditorial.
	genders := aGenders
]
