Class {
	#name : #HomeComponent,
	#superclass : #WAComponent,
	#instVars : [
		'alertComponent'
	],
	#category : #'Bookflix-UI-others'
}

{ #category : #accessing }
HomeComponent >> addAlert: anAlertComponent [
	^ alertComponent := anAlertComponent
]

{ #category : #seaside }
HomeComponent >> call: aComponent [
	self home.
	self addAlert: (super call: aComponent)
]

{ #category : #private }
HomeComponent >> clearAlert [
	alertComponent := nil
]

{ #category : #private }
HomeComponent >> getBookComponents [
	^ Bookflix instance getAllBooks
		collect: [ :each | ProxyBookComponent book: each in: self ]
]

{ #category : #seaside }
HomeComponent >> home [
	self clearAlert.
	super home
]

{ #category : #rendering }
HomeComponent >> renderAlertOn: html [
	alertComponent ifNotNil: [ html render: alertComponent ]
]

{ #category : #rendering }
HomeComponent >> renderBooksOn: html [
	html div
		class: 'card-columns custom-columns';
		with: [ self getBookComponents
				do: [ :bookComponent | html render: bookComponent ] ]
]

{ #category : #rendering }
HomeComponent >> renderContentOn: html [
	html div
		class: 'container';
		style: 'margin-top:3em';
		with: [ self
				renderAlertOn: html;
				renderBooksOn: html ]
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
