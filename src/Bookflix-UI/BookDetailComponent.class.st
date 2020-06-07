Class {
	#name : #BookDetailComponent,
	#superclass : #WAComponent,
	#instVars : [
		'book'
	],
	#category : #'Bookflix-UI-books'
}

{ #category : #construction }
BookDetailComponent class >> with: aBook [
	^ self new with: aBook
]

{ #category : #rendering }
BookDetailComponent >> renderContentOn: html [
	html div
		class: 'container my-4';
		with: [ html render: (BookInformationComponent with: book) ]
]

{ #category : #seaside }
BookDetailComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - ' , book title
]

{ #category : #initialization }
BookDetailComponent >> with: aBook [
	book := aBook
]
