Class {
	#name : #ReadableOperationComponent,
	#superclass : #SimpleFormComponent,
	#instVars : [
		'titleInput',
		'descriptionInput',
		'expirationDateInput',
		'errorByExpiryDate'
	],
	#category : #'Bookflix-UI-add/modify'
}

{ #category : #accessing }
ReadableOperationComponent >> descriptionInput [
	^ descriptionInput
]

{ #category : #accessing }
ReadableOperationComponent >> descriptionInput: anObject [
	descriptionInput := anObject
]

{ #category : #initialization }
ReadableOperationComponent >> initialize [
	super initialize.
	errorByExpiryDate := false
]

{ #category : #rendering }
ReadableOperationComponent >> renderDataInputOn: html [
	self
		renderTitleOn: html;
		renderDescriptionOn: html;
		renderExpirationDateOn: html
]

{ #category : #rendering }
ReadableOperationComponent >> renderDescriptionOn: html [
	html div
		class: 'form-group';
		with: [ html label
				for: 'input_description';
				with: 'Descripción'.
			html textInput
				id: 'input_description';
				class: 'form-control';
				placeholder: 'Descripción';
				required;
				on: #descriptionInput of: self ]
]

{ #category : #rendering }
ReadableOperationComponent >> renderErrorByExpiryDateOn: html [
	html small
		class: 'form-text text-danger';
		with: 'La fecha de vencimiento ingresada ya se encuentra vencida'
]

{ #category : #rendering }
ReadableOperationComponent >> renderExpirationDateOn: html [
	html div
		class: 'form-group';
		with: [ html label
				for: 'expiration_date_input';
				with: 'Fecha de Vencimiento'.
			html dateInput5
				id: 'expiration_date_input';
				class: 'form-control';
				placeholder: 'Fecha de Vencimiento';
				value:
					(expirationDateInput ifNotNil: [ expirationDateInput asDate yyyymmdd ]);
				callback: [ :input | 
					expirationDateInput := input
						ifEmpty: [ nil ]
						ifNotEmpty: [ Date fromString: input ] ].
			errorByExpiryDate
				ifTrue: [ self renderErrorByExpiryDateOn: html ] ]
]

{ #category : #rendering }
ReadableOperationComponent >> renderTitleOn: html [
	html div
		class: 'form-group';
		with: [ html label
				for: 'input_title';
				with: 'Titulo'.
			html textInput
				id: 'input_title';
				class: 'form-control';
				placeholder: 'Titulo';
				required;
				autofocus;
				on: #titleInput of: self ]
]

{ #category : #accessing }
ReadableOperationComponent >> titleInput [
	^ titleInput
]

{ #category : #accessing }
ReadableOperationComponent >> titleInput: anObject [
	titleInput := anObject
]

{ #category : #validation }
ReadableOperationComponent >> validateInputData [
	expirationDateInput
		ifNil: [ errorByExpiryDate := false ]
		ifNotNil: [ errorByExpiryDate := expirationDateInput <= Date today ].
	^ errorByExpiryDate not
]
