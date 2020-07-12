Class {
	#name : #BookflixSample,
	#superclass : #Object,
	#category : #'Bookflix-Model-Samples'
}

{ #category : #initialization }
BookflixSample class >> resetState [
	VORepository current
		dropDatabase;
		reset.
	UserSample addUsers.
	AuthorSample addAuthors.
	EditorialSample addEditorials.
	GenderSample addGenders.
	BookSample addBooks
]
