Class {
	#name : #HomeComponentClosedSessionState,
	#superclass : #HomeComponentState,
	#category : #'Bookflix-UI-others'
}

{ #category : #get }
HomeComponentClosedSessionState >> getReadablesComponents [
	^ Bookflix instance getAllNovelty
		collect: [ :each | NoveltyComponent with: each in: homeComponent ]
]

{ #category : #rendering }
HomeComponentClosedSessionState >> renderElementsOn: html [
	html anchor
		class: 'btn btn-primary';
		callback: [ homeComponent call: LoginComponent new ];
		with: 'Iniciar Sesión'.
	self renderReadablesOn: html
]

{ #category : #reset }
HomeComponentClosedSessionState >> resetState [
	homeComponent
		state: (HomeComponentClosedSessionState of: homeComponent)
]
