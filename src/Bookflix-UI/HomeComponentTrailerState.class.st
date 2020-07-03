Class {
	#name : #HomeComponentTrailerState,
	#superclass : #HomeComponentState,
	#category : #'Bookflix-UI-others'
}

{ #category : #get }
HomeComponentTrailerState >> getReadablesComponents [
	"Bookflix instance getAllAdvances"

	^ Advance selectAll
		collect: [ :each | TrailerComponentProxy with: each in: homeComponent ]
]

{ #category : #rendering }
HomeComponentTrailerState >> renderElementsOn: html [
	homeComponent renderAlertOn: html.
	self renderCategoryButtonGroupOn: html.
	homeComponent renderReadablesOn: html
]

{ #category : #private }
HomeComponentTrailerState >> trailerCategoryButtonClass [
	^ self activeCategoryButtonClass
]
