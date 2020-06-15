Class {
	#name : #Book,
	#superclass : #Readable,
	#instVars : [
		'isbn',
		'imageURL',
		'author',
		'editorial',
		'genders',
		'advance'
	],
	#category : #'Bookflix-Model'
}

{ #category : #testing }
Book class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
Book class >> newWithTitle: aTitle isbn: aISBN description: aDescription imageURL: aImageURL author: aAuthor editorial: aEditorial [
	^ (self title: aTitle description: aDescription)
		isbn: aISBN
			imageURL: aImageURL
			author: aAuthor
			editorial: aEditorial;
		yourself
]

{ #category : #'instance creation' }
Book class >> newWithTitle: aTitle isbn: aISBN description: aDescription imageURL: aImageURL author: aAuthor editorial: aEditorial expirationDate: aDate [
	^ (self title: aTitle description: aDescription expirationDate: aDate)
		isbn: aISBN
			imageURL: aImageURL
			author: aAuthor
			editorial: aEditorial;
		yourself
]

{ #category : #accessing }
Book >> addGender: aGender [
	genders add: aGender.
	aGender addBook: self
]

{ #category : #accessing }
Book >> advance [
	^ advance
]

{ #category : #accessing }
Book >> advance: aAdvance [
	advance := aAdvance.
	aAdvance book: self
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
Book >> imageURL [
	^ imageURL
]

{ #category : #accessing }
Book >> imageURL: aImageURL [
	imageURL := aImageURL
]

{ #category : #initialization }
Book >> initialize [
	super initialize.
	isbn := 0000.
	imageURL := ''.
	author := nil.
	editorial := nil.
	genders := OrderedCollection new.
	advance := nil
]

{ #category : #accessing }
Book >> isbn [
	^ isbn
]

{ #category : #accessing }
Book >> isbn: aISBN [
	isbn := aISBN
]

{ #category : #setting }
Book >> isbn: aISBN imageURL: aImageURL author: aAuthor editorial: aEditorial [
	isbn := aISBN.
	imageURL := aImageURL.
	author := aAuthor.
	editorial := aEditorial
]
