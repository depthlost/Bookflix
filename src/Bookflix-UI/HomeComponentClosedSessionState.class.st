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
	self
		renderLoginButtonOn: html;
		renderReadablesOn: html
]

{ #category : #rendering }
HomeComponentClosedSessionState >> renderLoginButtonOn: html [
	html div
		class: 'd-flex justify-content-end';
		with: [ html anchor
				class: 'btn btn-primary';
				callback: [ homeComponent call: LoginComponent new ];
				with: 'Iniciar Sesión' ]
]

{ #category : #reset }
HomeComponentClosedSessionState >> resetState [
	homeComponent
		state: (HomeComponentClosedSessionState of: homeComponent)
]
