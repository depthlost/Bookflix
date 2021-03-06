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
		with: [ self renderTopRowOn: html.
			html render: (CommentListComponent book: book) ]
]

{ #category : #rendering }
BookDetailComponent >> renderTopRowOn: html [
	html div
		class: 'row';
		with: [ html div
				class: 'col-md-4 h-100 d-flex justify-content-center mb-4';
				with: [ html render: simpleViewComponent ].
			html div
				class: 'col-md-8 h-100 mb-4';
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
	simpleViewComponent := book isCompleteBook
		ifTrue: [ SimpleViewCompleteBookComponent with: book in: self ]
		ifFalse: [ SimpleViewChaptersBookComponent with: book in: self ]
]
