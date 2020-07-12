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

{ #category : #accessing }
HomeComponent >> alertComponent [
	^ alertComponent
]

{ #category : #seaside }
HomeComponent >> call: aComponent [
	self home.
	super
		call: aComponent
		onAnswer: [ :answer | 
			answer className = 'AlertComponent'
				ifTrue: [ self addAlert: answer ] ]
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
HomeComponent >> home [
	self
		clearAlert;
		resetState.
	super home
]

{ #category : #initialization }
HomeComponent >> initialize [
	super initialize.
	state := HomeComponentClosedSessionState of: self
]

{ #category : #'changing state' }
HomeComponent >> loadSessionState [
	super home.
	state := HomeComponentBookState of: self.
	self session user isAdmin
		ifFalse: [ self show: UserProfilesViewComponent new ]
]

{ #category : #rendering }
HomeComponent >> renderContentOn: html [
	html div
		class: 'container';
		style: 'margin-top:2em';
		with: [ state renderElementsOn: html ]
]

{ #category : #private }
HomeComponent >> resetState [
	state resetState
]

{ #category : #'changing state' }
HomeComponent >> showFavoriteBooks [
	self
		home;
		state: (HomeComponentFavoriteState of: self)
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
