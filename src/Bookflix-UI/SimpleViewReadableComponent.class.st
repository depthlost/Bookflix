Class {
	#name : #SimpleViewReadableComponent,
	#superclass : #WAComponent,
	#instVars : [
		'readable',
		'parentComponent'
	],
	#category : #'Bookflix-UI-readables'
}

{ #category : #construction }
SimpleViewReadableComponent class >> with: aReadable in: aComponent [
	^ self new with: aReadable in: aComponent
]

{ #category : #rendering }
SimpleViewReadableComponent >> renderBodyOn: html [
	self subclassResponsibility
]

{ #category : #rendering }
SimpleViewReadableComponent >> renderContentOn: html [
	html div
		class: 'card';
		style: 'max-width: 16rem';
		with: [ self
				renderHeadOn: html;
				renderBodyOn: html ]
]

{ #category : #rendering }
SimpleViewReadableComponent >> renderHeadOn: html [
	self subclassResponsibility
]

{ #category : #initialization }
SimpleViewReadableComponent >> with: aReadable in: aComponent [
	readable := aReadable.
	parentComponent := aComponent
]
