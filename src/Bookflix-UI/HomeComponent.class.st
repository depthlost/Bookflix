Class {
	#name : #HomeComponent,
	#superclass : #WAComponent,
	#category : #'Bookflix-UI-others'
}

{ #category : #private }
HomeComponent >> getBookComponents [
	^ Bookflix instance getAllBooks
		collect: [ :each | ProxyBookComponent book: each in: self ]
]

{ #category : #rendering }
HomeComponent >> renderBooksOn: html [
	self getBookComponents
		do: [ :bookComponent | html render: bookComponent ]
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
