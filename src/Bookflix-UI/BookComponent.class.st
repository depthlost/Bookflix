Class {
	#name : #BookComponent,
	#superclass : #WAComponent,
	#instVars : [
		'book'
	],
	#category : #'Bookflix-UI'
}

{ #category : #'as yet unclassified' }
BookComponent class >> book: aBook [
	^ self new book: aBook
]

{ #category : #accessing }
BookComponent >> book: aBook [
	book := aBook
]

{ #category : #rendering }
BookComponent >> renderBookBodyOn: html [
	html div
		class: 'card-body';
		with: [ self
				renderTitleOn: html;
				renderDescriptionOn: html ]
]

{ #category : #rendering }
BookComponent >> renderBookContentOn: html [
	self
		renderImageOn: html;
		renderBookBodyOn: html
]

{ #category : #rendering }
BookComponent >> renderContentOn: html [
	html div
		class: 'card';
		with: [ self renderBookContentOn: html ]
]

{ #category : #rendering }
BookComponent >> renderDescriptionOn: html [
	html paragraph
		class: 'card-text';
		with: book description
]

{ #category : #rendering }
BookComponent >> renderImageOn: html [
	html image
		class: 'card-img-top book-cover-image';
		url: book imageURL
]

{ #category : #rendering }
BookComponent >> renderTitleOn: html [
	html heading level5
		class: 'card-title';
		with: book title
]

{ #category : #seaside }
BookComponent >> states [
	^ Array with: self
]