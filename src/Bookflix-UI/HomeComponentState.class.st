Class {
	#name : #HomeComponentState,
	#superclass : #Object,
	#instVars : [
		'homeComponent'
	],
	#category : #'Bookflix-UI-others'
}

{ #category : #construction }
HomeComponentState class >> of: aHomeComponent [
	^ self new of: aHomeComponent
]

{ #category : #private }
HomeComponentState >> activeBookState [
	^ false
]

{ #category : #private }
HomeComponentState >> activeNoveltyState [
	^ false
]

{ #category : #private }
HomeComponentState >> activeTrailerState [
	^ false
]

{ #category : #private }
HomeComponentState >> bookCategoryButtonClass [
	| class |
	class := 'btn btn-outline-dark'.
	self activeBookState
		ifTrue: [ class := class , ' active' ].
	^ class
]

{ #category : #seaside }
HomeComponentState >> children [
	^ Array new
]

{ #category : #get }
HomeComponentState >> getReadablesComponents [
	self subclassResponsibility
]

{ #category : #private }
HomeComponentState >> noveltyCategoryButtonClass [
	| class |
	class := 'btn btn-outline-dark'.
	self activeNoveltyState
		ifTrue: [ class := class , ' active' ].
	^ class
]

{ #category : #initialization }
HomeComponentState >> of: aHomeComponent [
	homeComponent := aHomeComponent
]

{ #category : #rendering }
HomeComponentState >> renderBooksCategoryButtonOn: html [
	html anchor
		class: self bookCategoryButtonClass;
		callback: [ homeComponent state: (HomeComponentBookState of: homeComponent) ];
		with: 'Libros'
]

{ #category : #rendering }
HomeComponentState >> renderCategoryButtonGroupOn: html [
	html div
		class: 'mb-2 d-flex justify-content-end';
		with: [ html div
				class: 'btn-group';
				attributeAt: 'role' put: 'group';
				with: [ self
						renderBooksCategoryButtonOn: html;
						renderNoveltiesCategoryButtonOn: html;
						renderTrailersCategoryButtonOn: html ] ]
]

{ #category : #rendering }
HomeComponentState >> renderElementsOn: html [
	self subclassResponsibility
]

{ #category : #rendering }
HomeComponentState >> renderNoveltiesCategoryButtonOn: html [
	html anchor
		class: self noveltyCategoryButtonClass;
		callback: [ homeComponent state: (HomeComponentNoveltyState of: homeComponent) ];
		with: 'Novedades'
]

{ #category : #rendering }
HomeComponentState >> renderTrailersCategoryButtonOn: html [
	html anchor
		class: self trailerCategoryButtonClass;
		callback: [ homeComponent state: (HomeComponentTrailerState of: homeComponent) ];
		with: 'Trailers'
]

{ #category : #private }
HomeComponentState >> trailerCategoryButtonClass [
	| class |
	class := 'btn btn-outline-dark'.
	self activeTrailerState
		ifTrue: [ class := class , ' active' ].
	^ class
]
