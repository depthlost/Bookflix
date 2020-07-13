Class {
	#name : #ChaptersBookContentInputComponent,
	#superclass : #BookContentInputComponent,
	#instVars : [
		'contentInputs',
		'chaptersQuantityInput'
	],
	#category : #'Bookflix-UI-add/modify'
}

{ #category : #construction }
ChaptersBookContentInputComponent class >> with: aStringCollection andChaptersQuantity: aNumber [
	^ self new with: aStringCollection andChaptersQuantity: aNumber
]

{ #category : #callbacks }
ChaptersBookContentInputComponent >> addContentUrl [
	contentInputs add: ''.
	chaptersQuantityInput := chaptersQuantityInput
		max: contentInputs size
]

{ #category : #accessing }
ChaptersBookContentInputComponent >> chaptersQuantityInput [
	^ chaptersQuantityInput
]

{ #category : #accessing }
ChaptersBookContentInputComponent >> content [
	^ contentInputs
]

{ #category : #initialization }
ChaptersBookContentInputComponent >> initialize [
	super initialize.
	contentInputs := OrderedCollection with: ''.
	chaptersQuantityInput := 1
]

{ #category : #rendering }
ChaptersBookContentInputComponent >> renderAddContentUrlButtonOn: html [
	html button
		type: 'submit';
		class: 'btn btn-success';
		callback: [ self addContentUrl ];
		with: '+'
]

{ #category : #rendering }
ChaptersBookContentInputComponent >> renderChaptersQuantityOn: html [
	html div
		class: 'form-group';
		with: [ html label
				for: 'chapters_quantity_input';
				with: 'Cantidad de capítulos'.
			html numberInput
				id: 'chapters_quantity_input';
				class: 'form-control';
				placeholder: 'Cantidad de capítulos';
				required;
				value: chaptersQuantityInput;
				callback:
						[ :input | chaptersQuantityInput := input asNumber max: contentInputs size ] ]
]

{ #category : #rendering }
ChaptersBookContentInputComponent >> renderContentInputOn: html [
	contentInputs allButLast
		doWithIndex: [ :each :index | self renderExistingContentUrl: index on: html ].
	self renderNewContentUrlOn: html
]

{ #category : #rendering }
ChaptersBookContentInputComponent >> renderContentOn: html [
	super renderContentOn: html.
	self renderChaptersQuantityOn: html
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
ChaptersBookContentInputComponent >> with: aStringCollection andChaptersQuantity: aNumber [
	contentInputs := aStringCollection.
	chaptersQuantityInput := aNumber
]
