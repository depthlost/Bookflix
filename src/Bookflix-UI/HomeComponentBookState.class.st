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

{ #category : #private }
HomeComponentBookState >> categoryButtonGroupClass [
	^ 'mb-2 mb-md-4 col-12 col-md-6 d-flex justify-content-end order-0 order-md-1'
]

{ #category : #seaside }
HomeComponentBookState >> children [
	^ super children , (Array with: searchComponent)
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
	super initialize.
	searchComponent := SearchComponent new
]

{ #category : #rendering }
HomeComponentBookState >> renderElementsOn: html [
	self renderAlertOn: html.
	html div
		class: 'row';
		with: [ self
				renderSeekerOn: html;
				renderCategoryButtonGroupOn: html ].
	self renderReadablesOn: html
]

{ #category : #rendering }
HomeComponentBookState >> renderSeekerOn: html [
	html div
		class:
			'mb-4 col-12 col-md-6 d-flex justify-content-center order-1 order-md-0';
		with: [ html render: searchComponent ]
]
