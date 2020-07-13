Class {
	#name : #HomeComponentTrailerState,
	#superclass : #HomeComponentCategoryState,
	#category : #'Bookflix-UI-others'
}

{ #category : #get }
HomeComponentTrailerState >> getReadablesComponents [
	^ (Bookflix instance getAdvancesFor: homeComponent session user)
		collect: [ :each | TrailerComponentProxy with: each in: homeComponent ]
]

{ #category : #private }
HomeComponentTrailerState >> trailerCategoryButtonClass [
	^ self activeCategoryButtonClass
]
