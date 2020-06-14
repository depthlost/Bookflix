Class {
	#name : #BookDetailComponent,
	#superclass : #WAComponent,
	#instVars : [
		'book',
		'bookInformationComponent',
		'simpleBookComponent'
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
		with: [ self renderTopRowOn: html ]
]

{ #category : #rendering }
BookDetailComponent >> renderTopRowOn: html [
	html div
		class: 'row';
		with: [ html div
				class: 'col-3';
				with: [ html render: simpleBookComponent ].
			html div
				class: 'col-9';
				with: [ html render: bookInformationComponent ] ]
]

{ #category : #seaside }
BookDetailComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - ' , book title
]

{ #category : #initialization }
BookDetailComponent >> with: aBook [
	book := aBook.
	bookInformationComponent := BookInformationComponent with: book.
	simpleBookComponent := SimpleBookComponent with: book in: self
]
