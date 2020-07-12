Class {
	#name : #HomeComponentCategoryState,
	#superclass : #HomeComponentStartedSessionState,
	#category : #'Bookflix-UI-others'
}

{ #category : #private }
HomeComponentCategoryState >> activeCategoryButtonClass [
	^ self defaultClassOfCategoryButton , ' active'
]

{ #category : #private }
HomeComponentCategoryState >> bookCategoryButtonClass [
	^ self defaultClassOfCategoryButton
]

{ #category : #private }
HomeComponentCategoryState >> defaultClassOfCategoryButton [
	^ 'btn btn-outline-dark'
]

{ #category : #private }
HomeComponentCategoryState >> noveltyCategoryButtonClass [
	^ self defaultClassOfCategoryButton
]

{ #category : #rendering }
HomeComponentCategoryState >> renderBooksCategoryButtonOn: html [
	html anchor
		class: self bookCategoryButtonClass;
		callback: [ homeComponent state: (HomeComponentBookState of: homeComponent) ];
		with: 'Libros'
]

{ #category : #rendering }
HomeComponentCategoryState >> renderCategoryButtonGroupOn: html [
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
HomeComponentCategoryState >> renderElementsOn: html [
	self
		renderAlertOn: html;
		renderCategoryButtonGroupOn: html;
		renderReadablesOn: html
]

{ #category : #rendering }
HomeComponentCategoryState >> renderNoveltiesCategoryButtonOn: html [
	html anchor
		class: self noveltyCategoryButtonClass;
		callback: [ homeComponent state: (HomeComponentNoveltyState of: homeComponent) ];
		with: 'Novedades'
]

{ #category : #rendering }
HomeComponentCategoryState >> renderTrailersCategoryButtonOn: html [
	html anchor
		class: self trailerCategoryButtonClass;
		callback: [ homeComponent state: (HomeComponentTrailerState of: homeComponent) ];
		with: 'Trailers'
]

{ #category : #private }
HomeComponentCategoryState >> trailerCategoryButtonClass [
	^ self defaultClassOfCategoryButton
]
