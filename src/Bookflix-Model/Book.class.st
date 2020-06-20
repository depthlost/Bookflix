Class {
	#name : #Book,
	#superclass : #Readable,
	#instVars : [
		'isbn',
		'imageURL',
		'author',
		'editorial',
		'genders',
		'advance',
		'chapters'
	],
	#category : #'Bookflix-Model'
}

{ #category : #'instance creation' }
Book class >> title: aTitle isbn: aISBN description: aDescription imageURL: aImageURL author: aAuthor editorial: aEditorial content: aCollection [
	^ (self title: aTitle description: aDescription)
		isbn: aISBN
			imageURL: aImageURL
			author: aAuthor
			editorial: aEditorial
			content: aCollection;
		yourself
]

{ #category : #'instance creation' }
Book class >> title: aTitle isbn: aISBN description: aDescription imageURL: aImageURL author: aAuthor editorial: aEditorial expirationDate: aDate content: aCollection [
	^ (self title: aTitle description: aDescription expirationDate: aDate)
		isbn: aISBN
			imageURL: aImageURL
			author: aAuthor
			editorial: aEditorial
			content: aCollection;
		yourself
]

{ #category : #adding }
Book >> addChapter: aChapter [
	chapters add: aChapter
]

{ #category : #adding }
Book >> addChapters: aChapters [
	aChapters do: [ :chapter | self addChapter: chapter ]
]

{ #category : #accessing }
Book >> addGender: aGender [
	genders add: aGender.
	aGender addBook: self
]

{ #category : #accessing }
Book >> addGenders: aGenders [
	aGenders do: [ :gender | self addGender: gender ]
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
	author = aAuthor
		ifTrue: [ ^ self ].
	author ifNotNil: [ :arg | author removeBook: self ].
	author := aAuthor.
	author addBook: self
]

{ #category : #accessing }
Book >> content [
	^ chapters
]

{ #category : #accessing }
Book >> editorial [
	^ editorial
]

{ #category : #accessing }
Book >> editorial: aEditorial [
	editorial = aEditorial
		ifTrue: [ ^ self ].
	editorial ifNotNil: [ :arg | editorial removeBook: self ].
	editorial := aEditorial.
	editorial addBook: self
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
	genders := OrderedCollection new.
	chapters := OrderedCollection new.
	author := nil.
	editorial := nil.
	advance := nil
]

{ #category : #testing }
Book >> isCompleteBook [
	^ chapters size <= 1
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
Book >> isbn: aISBN imageURL: aImageURL author: aAuthor editorial: aEditorial content: aCollection [
	isbn := aISBN.
	imageURL := aImageURL.
	self author: aAuthor.
	self editorial: aEditorial.
	chapters := aCollection
]

{ #category : #adding }
Book >> removeChapter: aChapter [
	chapters remove: aChapter
]

{ #category : #adding }
Book >> removeChapters: aChapters [
	aChapters do: [ :chapter | self removeChapter: chapter ]
]

{ #category : #accessing }
Book >> removeGender: aGender [
	(genders included: aGender)
		ifFalse: [ ^ self ].
	aGender removeBook: self.
	genders remove: self
]

{ #category : #accessing }
Book >> removeGenders: aGenders [
	aGenders do: [ :gender | self removeGender: gender ]
]
