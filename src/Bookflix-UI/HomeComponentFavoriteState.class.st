Class {
	#name : #HomeComponentFavoriteState,
	#superclass : #HomeComponentStartedSessionState,
	#category : #'Bookflix-UI-others'
}

{ #category : #get }
HomeComponentFavoriteState >> getReadablesComponents [
	^ homeComponent session profile favorites
		collect: [ :each | BookComponentProxy with: each in: homeComponent ]
]

{ #category : #rendering }
HomeComponentFavoriteState >> renderElementsOn: html [
	self
		renderTitleOn: html;
		renderAlertOn: html;
		renderReadablesOn: html
]

{ #category : #rendering }
HomeComponentFavoriteState >> renderTitleOn: html [
	html heading level1
		class: 'h3 mb-5 font-weight-normal text-center';
		with: 'Lista de Favoritos'
]
