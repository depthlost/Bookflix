Class {
	#name : #ModalButtonComponent,
	#superclass : #WAComponent,
	#instVars : [
		'modal',
		'class',
		'style',
		'content'
	],
	#category : #'Bookflix-UI-resources'
}

{ #category : #'instance creation' }
ModalButtonComponent class >> modal: aModalComponent class: aClass style: aStyle with: aContent [
	^ self new
		modal: aModalComponent
		class: aClass
		style: aStyle
		with: aContent
]

{ #category : #'instance creation' }
ModalButtonComponent class >> modal: aModalComponent class: aClass with: aContent [
	^ self new
		modal: aModalComponent
		class: aClass
		style: ''
		with: aContent
]

{ #category : #'instance creation' }
ModalButtonComponent class >> modal: aModalComponent style: aStyle with: aContent [
	^ self new
		modal: aModalComponent
		class: ''
		style: aStyle
		with: aContent
]

{ #category : #'instance creation' }
ModalButtonComponent class >> modal: aModalComponent with: aContent [
	^ self new
		modal: aModalComponent
		class: ''
		style: ''
		with: aContent
]

{ #category : #initialization }
ModalButtonComponent >> modal: aModalComponent class: aClass style: aStyle with: aContent [
	modal := aModalComponent.
	class := aClass.
	style := aStyle.
	content := aContent
]

{ #category : #rendering }
ModalButtonComponent >> renderContentOn: html [
	html button
		type: 'button';
		class: class;
		style: style;
		attributeAt: 'data-toggle' put: 'modal';
		attributeAt: 'data-target' put: '#' , modal id;
		with: content.
	html render: modal
]
