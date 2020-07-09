Class {
	#name : #HomeComponentBookState,
	#superclass : #HomeComponentCategoryState,
	#instVars : [
		'searchComponent'
	],
	#category : #'Bookflix-UI-others'
}

{ #category : #private }
HomeComponentBookState >> bookCategoryButtonClass [
	^ self activeCategoryButtonClass
]

{ #category : #seaside }
HomeComponentBookState >> children [
	^ Array with: searchComponent
]

{ #category : #private }
HomeComponentBookState >> getBooks [
	^ searchComponent content ifNil: [ Bookflix instance getAllBooks ]
]

{ #category : #get }
HomeComponentBookState >> getReadablesComponents [
	^ self getBooks
		collect: [ :each | BookComponentProxy with: each in: homeComponent ]
]

{ #category : #initialization }
HomeComponentBookState >> initialize [
	searchComponent := SearchComponent new
]

{ #category : #rendering }
HomeComponentBookState >> renderElementsOn: html [
	homeComponent renderAlertOn: html.
	self renderCategoryButtonGroupOn: html.
	html render: searchComponent.
	homeComponent renderReadablesOn: html
]
