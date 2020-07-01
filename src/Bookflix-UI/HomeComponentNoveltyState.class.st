Class {
	#name : #HomeComponentNoveltyState,
	#superclass : #HomeComponentState,
	#category : #'Bookflix-UI-others'
}

{ #category : #get }
HomeComponentNoveltyState >> getReadablesComponents [
	^ Bookflix instance getAllNovelty
		collect: [ :each | NoveltyComponentProxy with: each in: homeComponent ]
]

{ #category : #rendering }
HomeComponentNoveltyState >> renderElementsOn: html [
	homeComponent
		renderAlertOn: html;
		renderCategoryButtonGroupOn: html;
		renderReadablesOn: html
]
