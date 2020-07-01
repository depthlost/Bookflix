Class {
	#name : #HomeComponentNoveltyState,
	#superclass : #HomeComponentState,
	#category : #'Bookflix-UI-others'
}

{ #category : #private }
HomeComponentNoveltyState >> activeNoveltyState [
	^ true
]

{ #category : #get }
HomeComponentNoveltyState >> getReadablesComponents [
	^ Bookflix instance getAllNovelty
		collect: [ :each | NoveltyComponentProxy with: each in: homeComponent ]
]

{ #category : #rendering }
HomeComponentNoveltyState >> renderElementsOn: html [
	homeComponent renderAlertOn: html.
	self renderCategoryButtonGroupOn: html.
	homeComponent renderReadablesOn: html
]
