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
Bookflix >> existingAuthor: aName [
	^ self getAllAuthors anySatisfy: [ :author | author name = aName ]
]

{ #category : #'as yet unclassified' }
Bookflix >> existingEditorial: aName [
	^ self getAllEditorials
		anySatisfy: [ :editorial | editorial name = aName ]
]

{ #category : #'as yet unclassified' }
Bookflix >> existingGender: aName [
	^ self getAllGenders
		anySatisfy: [ :gender | gender name = aName ]
]

{ #category : #'as yet unclassified' }
Bookflix >> existingIsbn: aIsbn [
	^ self getAllBooks anySatisfy: [ :book | book isbn = aIsbn ]
]

{ #category : #'as yet unclassified' }
Bookflix >> finderBooksThatSatisfy: aName with: aStrategy [
	^ aStrategy finder: aName
]

{ #category : #'as yet unclassified' }
Bookflix >> getAllAuthors [
	^ BookAuthor selectAll
]

{ #category : #'as yet unclassified' }
Bookflix >> getAllBooks [
	^ Book selectAll reject: [ :book | book isExpired ]
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
Bookflix >> getAllUsers [
	^ User selectAll
]

{ #category : #'as yet unclassified' }
Bookflix >> getBookSortForCantRead [
	^ self getAllBooks
		sort: [ :book1 :book2 | book1 cantReads >= book2 cantReads ]
]

{ #category : #'as yet unclassified' }
Bookflix >> getBooksFor: aUser [
	aUser isAdmin
		ifTrue: [ ^ Book selectAll ].
	^ Book selectAll reject: [ :book | book isExpired ]
]

{ #category : #'as yet unclassified' }
Bookflix >> getNoveltysFor: aUser [
	aUser isAdmin
		ifTrue: [ ^ Advance selectAll ].
	^ Advance selectAll reject: [ :book | book isExpired ]
]

{ #category : #'as yet unclassified' }
Bookflix >> getUserWithEmail: aEmail [
	^ self getAllUsers detect: [ :user | user email = aEmail ]
]

{ #category : #'as yet unclassified' }
Bookflix >> getUserWithEmail: anEmail andPassword: aPassword [
	^ User selectAll
		detect: [ :user | user email = anEmail & (user password = aPassword) ]
		ifNone: [ nil ]
]

{ #category : #accessing }
Bookflix >> recordsBetween: aDate1 and: aDate2 [
	^ self getAllUsers
		select: [ :user | user registrationDate between: aDate1 and: aDate2 ]
]

{ #category : #removing }
Bookflix >> removeAdvance: aAdvance [
	aAdvance detach.
	aAdvance remove
]

{ #category : #removing }
Bookflix >> removeBook: aBook [
	aBook detach.
	aBook remove
]

{ #category : #removing }
Bookflix >> removeNovelty: aNovelty [
	aNovelty remove
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
