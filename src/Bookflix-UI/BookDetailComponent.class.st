Class {
	#name : #BookDetailComponent,
	#superclass : #WAComponent,
	#instVars : [
		'book',
		'simpleViewComponent',
		'informationComponent'
	],
	#category : #'Bookflix-UI-readables'
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
				with: [ html render: simpleViewComponent ].
			html div
				class: 'col-9';
				with: [ html render: informationComponent ] ]
]

{ #category : #seaside }
BookDetailComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix - ' , book title.
	anHtmlRoot javascript url: JQDeploymentLibrary / #jQueryJs
]

{ #category : #initialization }
BookDetailComponent >> with: aBook [
	book := aBook.
	informationComponent := BookInformationComponent with: book.
	simpleViewComponent := SimpleViewBookComponent with: book in: self
]
