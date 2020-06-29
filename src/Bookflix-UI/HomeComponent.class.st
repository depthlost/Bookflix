Class {
	#name : #HomeComponent,
	#superclass : #WAComponent,
	#instVars : [
		'alertComponent',
		'searchComponent'
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

{ #category : #seaside }
HomeComponent >> children [
	^ Array with: searchComponent
]

{ #category : #private }
HomeComponent >> clearAlert [
	alertComponent := nil
]

{ #category : #private }
HomeComponent >> getBookComponents [
	"metodo modificado para retornar todos los leibles"

	"^ Bookflix instance getAllBooks
		collect: [ :each | ProxyBookComponent with: each in: self ]"

	^ searchComponent content
		ifNotNil:
			[ :books | books collect: [ :each | BookComponentProxy with: each in: self ] ]
		ifNil: [ (Book selectAll
				collect: [ :each | BookComponentProxy with: each in: self ])
				,
					(Novelty selectAll
						collect: [ :each | NoveltyComponentProxy with: each in: self ])
				,
					(Advance selectAll
						collect: [ :each | TrailerComponentProxy with: each in: self ]) ]
]

{ #category : #seaside }
HomeComponent >> home [
	self clearAlert.
	searchComponent := SearchComponent new.
	super home
]

{ #category : #initialization }
HomeComponent >> initialize [
	searchComponent := SearchComponent new
]

{ #category : #rendering }
HomeComponent >> renderAlertOn: html [
	alertComponent ifNotNil: [ html render: alertComponent ]
]

{ #category : #rendering }
HomeComponent >> renderBooksOn: html [
	html div
		class: 'd-flex justify-content-center';
		with: [ html div
				class: 'card-columns custom-columns';
				with: [ self getBookComponents
						do: [ :bookComponent | html render: bookComponent ] ] ]
]

{ #category : #rendering }
HomeComponent >> renderContentOn: html [
	html div
		class: 'container';
		style: 'margin-top:3em';
		with: [ self renderAlertOn: html.
			html render: searchComponent.
			self renderBooksOn: html ]
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
