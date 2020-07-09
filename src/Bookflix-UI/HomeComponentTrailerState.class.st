Class {
	#name : #HomeComponentTrailerState,
	#superclass : #HomeComponentCategoryState,
	#category : #'Bookflix-UI-others'
}

{ #category : #get }
HomeComponentTrailerState >> getReadablesComponents [
	"Bookflix instance getAllAdvances"

	^ Advance selectAll
		collect: [ :each | TrailerComponentProxy with: each in: homeComponent ]
]

{ #category : #private }
HomeComponentTrailerState >> trailerCategoryButtonClass [
	^ self activeCategoryButtonClass
]
