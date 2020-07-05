Class {
	#name : #ChaptersBookContentInputComponent,
	#superclass : #BookContentInputComponent,
	#instVars : [
		'contentInputs'
	],
	#category : #'Bookflix-UI-add/modify'
}

{ #category : #construction }
ChaptersBookContentInputComponent class >> with: aStringCollection [
	^ self new with: aStringCollection
]

{ #category : #accessing }
ChaptersBookContentInputComponent >> content [
	^ contentInputs
]

{ #category : #initialization }
ChaptersBookContentInputComponent >> initialize [
	super initialize.
	contentInputs := OrderedCollection with: ''
]

{ #category : #rendering }
ChaptersBookContentInputComponent >> renderAddContentUrlButtonOn: html [
	html button
		type: 'submit';
		class: 'btn btn-success';
		callback: [ contentInputs add: '' ];
		with: '+'
]

{ #category : #rendering }
ChaptersBookContentInputComponent >> renderContentInputOn: html [
	contentInputs allButLast
		doWithIndex: [ :each :index | self renderExistingContentUrl: index on: html ].
	self renderNewContentUrlOn: html
]

{ #category : #rendering }
ChaptersBookContentInputComponent >> renderContentUrl: index on: html [
	html urlInput
		class: 'form-control';
		placeholder: 'Link del Contenido';
		value: (contentInputs at: index);
		callback: [ :input | contentInputs at: index put: input asString ];
		required
]

{ #category : #rendering }
ChaptersBookContentInputComponent >> renderContentUrlOn: html [
	self renderContentUrl: contentInputs size on: html
]

{ #category : #rendering }
ChaptersBookContentInputComponent >> renderExistingContentUrl: index on: html [
	html div
		class: 'form-row mb-2';
		with: [ html div
				class: 'col-auto';
				with: [ self renderContentUrl: index on: html ].
			html div
				class: 'col-auto';
				with: [ self renderRemoveContentUrlButton: index on: html ] ]
]

{ #category : #rendering }
ChaptersBookContentInputComponent >> renderNewContentUrlOn: html [
	html div
		class: 'form-row mb-2';
		with: [ html div
				class: 'col-auto';
				with: [ self renderContentUrl: contentInputs size on: html ].
			html div
				class: 'col-auto';
				with: [ self renderAddContentUrlButtonOn: html ] ]
]

{ #category : #rendering }
ChaptersBookContentInputComponent >> renderRemoveContentUrlButton: index on: html [
	html button
		type: 'submit';
		class: 'btn btn-danger';
		callback: [ contentInputs removeAt: index ];
		with: 'x'
]

{ #category : #initialization }
ChaptersBookContentInputComponent >> with: aStringCollection [
	contentInputs := aStringCollection
]
