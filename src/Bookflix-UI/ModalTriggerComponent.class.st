Class {
	#name : #ModalTriggerComponent,
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
ModalTriggerComponent class >> modal: aModalComponent class: aClass style: aStyle with: aContent [
	^ self new
		modal: aModalComponent
		class: aClass
		style: aStyle
		with: aContent
]

{ #category : #'instance creation' }
ModalTriggerComponent class >> modal: aModalComponent class: aClass with: aContent [
	^ self new
		modal: aModalComponent
		class: aClass
		style: ''
		with: aContent
]

{ #category : #'instance creation' }
ModalTriggerComponent class >> modal: aModalComponent style: aStyle with: aContent [
	^ self new
		modal: aModalComponent
		class: ''
		style: aStyle
		with: aContent
]

{ #category : #'instance creation' }
ModalTriggerComponent class >> modal: aModalComponent with: aContent [
	^ self new
		modal: aModalComponent
		class: ''
		style: ''
		with: aContent
]

{ #category : #initialization }
ModalTriggerComponent >> modal: aModalComponent class: aClass style: aStyle with: aContent [
	modal := aModalComponent.
	class := aClass.
	style := aStyle.
	content := aContent
]
