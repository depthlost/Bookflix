Class {
	#name : #AlertComponent,
	#superclass : #WAComponent,
	#instVars : [
		'description'
	],
	#category : #'Bookflix-UI-resources'
}

{ #category : #construction }
AlertComponent class >> with: aDescription [
	^ self new with: aDescription
]

{ #category : #rendering }
AlertComponent >> renderContentOn: html [
	html div
		class: 'alert alert-success';
		attributeAt: 'role' put: 'alert';
		with: description
]

{ #category : #initialization }
AlertComponent >> with: aDescription [
	description := aDescription
]
