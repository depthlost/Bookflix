Class {
	#name : #SearchComponent,
	#superclass : #WAComponent,
	#instVars : [
		'contentInput',
		'criteriaInput',
		'books'
	],
	#category : #'Bookflix-UI-others'
}

{ #category : #accessing }
SearchComponent >> content [
	^ books
]

{ #category : #accessing }
SearchComponent >> criteriaInput [
	^ criteriaInput
]

{ #category : #accessing }
SearchComponent >> criteriaInput: anObject [
	criteriaInput := anObject
]

{ #category : #rendering }
SearchComponent >> renderContentOn: html [
	html form
		class: 'form-inline mb-4';
		with: [ self
				renderCriteriaOn: html;
				renderSearchContentOn: html ]
]

{ #category : #rendering }
SearchComponent >> renderCriteriaOn: html [
	html select
		class: 'form-control mr-2';
		style: 'width: 120px';
		list:
			{SearchforBookName instance.
			SearchforAuthorName instance.
			SearchforEditorialName instance.
			SearchforGenderName instance};
		on: #criteriaInput of: self;
		required
]

{ #category : #rendering }
SearchComponent >> renderSearchContentOn: html [
	html searchInput
		class: 'form-control w-50 mr-2';
		placeholder: 'Buscar';
		value: contentInput;
		callback: [ :input | 
			contentInput := input.
			self search ];
		required
]

{ #category : #callbacks }
SearchComponent >> search [
	books := Bookflix instance
		finderBooksThatSatisfy: contentInput
		with: criteriaInput
]
