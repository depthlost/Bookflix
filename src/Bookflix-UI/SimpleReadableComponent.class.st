Class {
	#name : #SimpleReadableComponent,
	#superclass : #WAComponent,
	#instVars : [
		'readable',
		'parentComponent'
	],
	#category : #'Bookflix-UI-readables'
}

{ #category : #construction }
SimpleReadableComponent class >> with: aReadable in: aComponent [
	^ self new with: aReadable in: aComponent
]

{ #category : #rendering }
SimpleReadableComponent >> renderBodyOn: html [
	self subclassResponsibility
]

{ #category : #rendering }
SimpleReadableComponent >> renderContentOn: html [
	html div
		class: 'card';
		style: 'max-width: 16rem';
		with: [ self
				renderImageOn: html;
				renderBodyOn: html ]
]

{ #category : #rendering }
SimpleReadableComponent >> renderImageOn: html [
	self subclassResponsibility
]

{ #category : #initialization }
SimpleReadableComponent >> with: aReadable in: aComponent [
	readable := aReadable.
	parentComponent := aComponent
]
