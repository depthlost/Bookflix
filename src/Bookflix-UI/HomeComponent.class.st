Class {
	#name : #HomeComponent,
	#superclass : #WAComponent,
	#instVars : [
		'bookComponents'
	],
	#category : #'Bookflix-UI'
}

{ #category : #seaside }
HomeComponent >> children [
	^ bookComponents
]

{ #category : #initialization }
HomeComponent >> initialize [
	super initialize.
	bookComponents := Bookflix instance getAllBooks
		collect: [ :each | ProxyBookComponent book: each andParentComponent: self ]
]

{ #category : #'add/remove' }
HomeComponent >> removeBookComponent: aBook [
	bookComponents
		remove: (bookComponents detect: [ :each | each book = aBook ])
]

{ #category : #rendering }
HomeComponent >> renderBooksOn: html [
	bookComponents do: [ :bookComponent | html render: bookComponent ]
]

{ #category : #rendering }
HomeComponent >> renderContentOn: html [
	html div
		class: 'container';
		style: 'margin-top:3em';
		with: [ html div
				class: 'card-columns custom-columns';
				with: [ self renderBooksOn: html ] ]
]

{ #category : #seaside }
HomeComponent >> states [
	^ Array with: self
]

{ #category : #seaside }
HomeComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot title: 'Bookflix'.
	anHtmlRoot stylesheet url: '/css/book_card.css'
]
