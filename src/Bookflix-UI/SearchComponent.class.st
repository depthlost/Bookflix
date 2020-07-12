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
		class: 'w-100';
		style: 'max-width: 30rem';
		with: [ self renderFormContentOn: html ]
]

{ #category : #rendering }
SearchComponent >> renderCriteriaOn: html [
	html select
		class: 'form-control';
		list:
			{SearchforBookName instance.
			SearchforAuthorName instance.
			SearchforEditorialName instance.
			SearchforGenderName instance};
		on: #criteriaInput of: self;
		required
]

{ #category : #rendering }
SearchComponent >> renderFormContentOn: html [
	html div
		class: 'input-group';
		with: [ html div
				class: 'input-group-prepend';
				with: [ self renderCriteriaOn: html ].
			self renderSearchContentOn: html ]
]

{ #category : #rendering }
SearchComponent >> renderSearchContentOn: html [
	html searchInput
		class: 'form-control';
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
