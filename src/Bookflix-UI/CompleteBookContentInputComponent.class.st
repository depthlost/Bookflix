Class {
	#name : #CompleteBookContentInputComponent,
	#superclass : #BookContentInputComponent,
	#instVars : [
		'contentInput'
	],
	#category : #'Bookflix-UI-add/modify'
}

{ #category : #construction }
CompleteBookContentInputComponent class >> with: aString [
	^ self new with: aString
]

{ #category : #accessing }
CompleteBookContentInputComponent >> content [
	^ contentInput
]

{ #category : #rendering }
CompleteBookContentInputComponent >> renderContentInputOn: html [
	html urlInput
		id: 'content_input';
		class: 'form-control';
		placeholder: 'Link del Contenido';
		value: contentInput;
		callback: [ :input | contentInput := input asString ];
		required
]

{ #category : #initialization }
CompleteBookContentInputComponent >> with: aString [
	contentInput := aString
]
