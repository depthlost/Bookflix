Class {
	#name : #Bookflix,
	#superclass : #Object,
	#classInstVars : [
		'instance'
	],
	#category : #'Bookflix-Model'
}

{ #category : #singleton }
Bookflix class >> clearInstance [
	instance := nil
]

{ #category : #singleton }
Bookflix class >> instance [
	^ instance ifNil: [ instance := Bookflix new ]
]

{ #category : #adding }
Bookflix >> addAuthor: aName [
	(BookAuthor name: aName) save
]

{ #category : #adding }
Bookflix >> addEditorial: aName [
	(Editorial name: aName) save
]

{ #category : #adding }
Bookflix >> addGender: aName [
	(Gender name: aName) save
]

{ #category : #'as yet unclassified' }
Bookflix >> addReadable: aReadable [
	aReadable isExpired
		ifFalse: [ aReadable save ]
]

{ #category : #'as yet unclassified' }
Bookflix >> existUserWithEmail: anEmail [
	^ User selectAll anySatisfy: [ :user | user email = anEmail ]
]

{ #category : #'as yet unclassified' }
Bookflix >> existingIsbn: aIsbn [
	| books |
	books := self getAllBooks.
	^ books anySatisfy: [ :book | book isbn = aIsbn ]
]

{ #category : #'as yet unclassified' }
Bookflix >> getAllAuthors [
	^ BookAuthor selectAll
]

{ #category : #'as yet unclassified' }
Bookflix >> getAllBooks [
	^ Author selectAll reject: [ :book | book isExpired ]
]

{ #category : #'as yet unclassified' }
Bookflix >> getAllEditorials [
	^ Editorial selectAll
]

{ #category : #'as yet unclassified' }
Bookflix >> getAllGenders [
	^ Gender selectAll
]

{ #category : #'as yet unclassified' }
Bookflix >> getAllNovelty [
	^ Novelty selectAll reject: [ :book | book isExpired ]
]

{ #category : #'as yet unclassified' }
Bookflix >> getAllReadables [
	^ Readable selectAll reject: [ :book | book isExpired ]
]

{ #category : #'as yet unclassified' }
Bookflix >> getUserWithEmail: anEmail andPassword: aPassword [
	^ User selectAll
		detect: [ :user | user email = anEmail & (user password = aPassword) ]
		ifNone: [ nil ]
]

{ #category : #removing }
Bookflix >> removeBook: aBook [
	aBook remove
]

{ #category : #'as yet unclassified' }
Bookflix >> returnBooksWithoutAdvance [
	^ self getAllBooks select: [ :readble | readble advance isNil ]
]

{ #category : #'as yet unclassified' }
Bookflix >> returnOrderedBookByAlphabet [
	^ self getAllBooks
		sort:
			[ :readble1 :readble2 | readble1 managementCriteria <= readble2 managementCriteria ]
]

{ #category : #'as yet unclassified' }
Bookflix >> returnOrderedNoveltyByAlphabet [
	^ self getAllNovelty
		sort:
			[ :readble1 :readble2 | readble1 managementCriteria <= readble2 managementCriteria ]
]

{ #category : #'as yet unclassified' }
Bookflix >> updateReadable: aReadable [
	aReadable save
]
