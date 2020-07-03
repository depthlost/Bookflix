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
	self
		home;
		addAlert: (super call: aComponent)
]

{ #category : #seaside }
HomeComponent >> children [
	^ state children
]

{ #category : #private }
HomeComponent >> clearAlert [
	alertComponent := nil
]

{ #category : #seaside }
HomeComponent >> clearThenHome [
	self session mainComponent navbar: ProxyNavBarComponent new.
	self
		clearAlert;
		resetState;
		home
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
HomeComponent >> renderNoContentMessageOn: html [
	html paragraph
		class: 'mt-2';
		with: 'No se encontro contenido'
]

{ #category : #rendering }
HomeComponent >> renderReadableList: aReadableCollection on: html [
	html div
		class: 'd-flex justify-content-center';
		with: [ html div
				class: 'card-columns custom-columns';
				with: [ aReadableCollection do: [ :each | html render: each ] ] ]
]

{ #category : #rendering }
HomeComponent >> renderReadablesOn: html [
	self getReadablesComponents
		ifNotEmpty: [ :readables | self renderReadableList: readables on: html ]
		ifEmpty: [ self renderNoContentMessageOn: html ]
]

{ #category : #private }
HomeComponent >> resetState [
	state := HomeComponentBookState of: self
]

{ #category : #accessing }
HomeComponent >> state: anObject [
	state := anObject
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
