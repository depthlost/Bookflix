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
		'chapters',
		'totalChapters',
		'comments',
		'votes',
		'reades'
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

{ #category : #adding }
Book >> addComment: aComment [
	comments add: aComment
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

{ #category : #adding }
Book >> addReader: aProfile [
	reades add: aProfile
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
Book >> cantDislikes [
	^ (votes reject: [ :vote | vote ]) size
]

{ #category : #accessing }
Book >> cantLikes [
	^ (votes select: [ :vote | vote ]) size
]

{ #category : #'as yet unclassified' }
Book >> cantReads [
	^ reades size
]

{ #category : #accessing }
Book >> content [
	^ chapters
]

{ #category : #modifying }
Book >> detach [
	author removeBook: self.
	editorial removeBook: self.
	advance ifNotNil: [ :arg | advance delete ].
	advance := nil.
	self save
]

{ #category : #'as yet unclassified' }
Book >> detachGenders [
	genders do: [ :gender | gender removeBook: self ]
]

{ #category : #accessing }
Book >> dislike: aProfile [
	| v |
	(votes anySatisfy: [ :vote | vote profile = aProfile ])
		ifTrue: [ v := votes detect: [ :vote | vote profile = aProfile ].
			v value
				ifTrue: [ v toggleValue ] ]
		ifFalse: [ votes add: (Vote profile: aProfile value: false) ]
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

{ #category : #adding }
Book >> getAllComments [
	^ comments
]

{ #category : #adding }
Book >> getCommentsWithoutSpoiler [
	^ comments reject: [ :comment | comment isSpoiler ]
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
	genders := Set new.
	chapters := OrderedCollection new.
	comments := OrderedCollection new.
	votes := Set new.
	totalChapters := 0.
	reades := Set new.
	author := nil.
	editorial := nil.
	advance := nil
]

{ #category : #testing }
Book >> isCompleteBook [
	^ chapters isString
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

{ #category : #accessing }
Book >> like: aProfile [
	| v |
	(votes anySatisfy: [ :vote | vote profile = aProfile ])
		ifTrue: [ v := votes detect: [ :vote | vote profile = aProfile ].
			v value
				ifFalse: [ v toggleValue ] ]
		ifFalse: [ votes add: (Vote profile: aProfile value: true) ]
]

{ #category : #accessing }
Book >> removeAdvance [
	advance := nil.
	self save
]

{ #category : #adding }
Book >> removeChapter: aChapter [
	chapters remove: aChapter
]

{ #category : #adding }
Book >> removeChapters: aChapters [
	aChapters do: [ :chapter | self removeChapter: chapter ]
]

{ #category : #adding }
Book >> removeComment: aComment [
	comments remove: aComment
]

{ #category : #accessing }
Book >> removeGender: aGender [
	(genders includes: aGender)
		ifFalse: [ ^ self ].
	aGender removeBook: self.
	genders remove: aGender
]

{ #category : #removing }
Book >> removeVote: aUser [
	(votes includesKey: aUser)
		ifTrue: [ ^ votes removeKey: aUser ].
	^ nil
]

{ #category : #accessing }
Book >> totalChapters [
	^ totalChapters
]

{ #category : #accessing }
Book >> totalChapters: aNum [
	totalChapters := aNum
]

{ #category : #adding }
Book >> updateChapters: aChapters [
	chapters := aChapters
]

{ #category : #accessing }
Book >> updateGenders: aGenders [
	self detachGenders.
	genders := Set new.
	self addGenders: aGenders
]

{ #category : #'as yet unclassified' }
Book >> voteOf: aProfile [
	(votes anySatisfy: [ :vote | vote profile = aProfile ])
		ifTrue: [ ^ votes detect: [ :vote | vote profile = aProfile ] ].
	^ nil
]
