Class {
	#name : #HomeComponentNoveltyState,
	#superclass : #HomeComponentCategoryState,
	#category : #'Bookflix-UI-others'
}

{ #category : #get }
HomeComponentNoveltyState >> getReadablesComponents [
	^ Bookflix instance getAllNovelty
		collect: [ :each | NoveltyComponentProxy with: each in: homeComponent ]
]

{ #category : #private }
HomeComponentNoveltyState >> noveltyCategoryButtonClass [
	^ self activeCategoryButtonClass
]
