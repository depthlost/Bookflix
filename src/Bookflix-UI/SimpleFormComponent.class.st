Class {
	#name : #SimpleFormComponent,
	#superclass : #WAComponent,
	#category : #'Bookflix-UI-add/modify'
}

{ #category : #private }
SimpleFormComponent >> buttonDescription [
	self subclassResponsibility
]

{ #category : #private }
SimpleFormComponent >> formTitle [
	self subclassResponsibility
]

{ #category : #callbacks }
SimpleFormComponent >> onSubmit [
	self subclassResponsibility
]

{ #category : #rendering }
SimpleFormComponent >> renderContentOn: html [
	html div
		class: 'container py-5';
		style: 'max-width: 320px;';
		with: [ html form: [ self renderFormOn: html ] ]
]

{ #category : #rendering }
SimpleFormComponent >> renderDataInputOn: html [
	self subclassResponsibility
]

{ #category : #rendering }
SimpleFormComponent >> renderFormOn: html [
	self
		renderFormTitleOn: html;
		renderDataInputOn: html;
		renderSubmitButtonOn: html
]

{ #category : #rendering }
SimpleFormComponent >> renderFormTitleOn: html [
	html heading level1
		class: 'h3 mb-3 font-weight-normal text-center mb-5';
		with: self formTitle
]

{ #category : #rendering }
SimpleFormComponent >> renderSubmitButtonOn: html [
	html button
		type: 'submit';
		class: 'btn btn-primary btn-block';
		callback: [ self submit ];
		with: self buttonDescription
]

{ #category : #callbacks }
SimpleFormComponent >> submit [
	self validateInputData
		ifFalse: [ ^ self ].
	self answer: self onSubmit
]

{ #category : #validation }
SimpleFormComponent >> validateInputData [
	^ true
]
