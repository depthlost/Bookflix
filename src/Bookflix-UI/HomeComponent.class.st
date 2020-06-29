Class {
	#name : #HomeComponent,
	#superclass : #WAComponent,
	#instVars : [
		'alertComponent',
		'state'
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
	^ state children
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

	"^ searchComponent content
		ifNotNil:
			[ :books | books collect: [ :each | BookComponentProxy with: each in: self ] ]
		ifNil: [ (Book selectAll
				collect: [ :each | BookComponentProxy with: each in: self ])
				,
					(Novelty selectAll
						collect: [ :each | NoveltyComponentProxy with: each in: self ])
				,
					(Advance selectAll
						collect: [ :each | TrailerComponentProxy with: each in: self ]) ]"
]

{ #category : #private }
HomeComponent >> getReadablesComponents [
	^ state getReadablesComponents
]

{ #category : #seaside }
HomeComponent >> home [
	self
		clearAlert;
		resetState.
	super home
]

{ #category : #initialization }
HomeComponent >> initialize [
	super initialize.
	self resetState
]

{ #category : #rendering }
HomeComponent >> renderAlertOn: html [
	alertComponent ifNotNil: [ html render: alertComponent ]
]

{ #category : #rendering }
HomeComponent >> renderBooksCategoryButtonOn: html [
	html anchor
		class: 'btn btn-outline-dark';
		callback: [ state := HomeComponentBookState of: self ];
		with: 'Libros'
]

{ #category : #rendering }
HomeComponent >> renderCategoryButtonGroupOn: html [
	html div
		class: 'mb-2 d-flex justify-content-end';
		with: [ html div
				class: 'btn-group';
				attributeAt: 'role' put: 'group';
				with: [ self
						renderBooksCategoryButtonOn: html;
						renderNoveltiesCategoryButtonOn: html;
						renderTrailersCategoryButtonOn: html ] ]
]

{ #category : #rendering }
HomeComponent >> renderContentOn: html [
	html div
		class: 'container';
		style: 'margin-top:2em';
		with: [ self renderElementsOn: html ]
]

{ #category : #rendering }
HomeComponent >> renderElementsOn: html [
	state renderElementsOn: html
]

{ #category : #rendering }
HomeComponent >> renderNoveltiesCategoryButtonOn: html [
	html anchor
		class: 'btn btn-outline-dark';
		callback: [ state := HomeComponentNoveltyState of: self ];
		with: 'Novedades'
]

{ #category : #rendering }
HomeComponent >> renderReadablesOn: html [
	html div
		class: 'd-flex justify-content-center';
		with: [ html div
				class: 'card-columns custom-columns';
				with: [ self getReadablesComponents do: [ :each | html render: each ] ] ]
]

{ #category : #rendering }
HomeComponent >> renderTrailersCategoryButtonOn: html [
	html anchor
		class: 'btn btn-outline-dark';
		callback: [ state := HomeComponentTrailerState of: self ];
		with: 'Trailers'
]

{ #category : #private }
HomeComponent >> resetState [
	state := HomeComponentBookState of: self
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
