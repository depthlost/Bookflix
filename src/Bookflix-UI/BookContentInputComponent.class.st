Class {
	#name : #BookContentInputComponent,
	#superclass : #WAComponent,
	#category : #'Bookflix-UI-add/modify'
}

{ #category : #accessing }
BookContentInputComponent >> content [
	self subclassResponsibility
]

{ #category : #rendering }
BookContentInputComponent >> renderContentInputOn: html [
	self subclassResponsibility
]

{ #category : #rendering }
BookContentInputComponent >> renderContentOn: html [
	html div
		class: 'form-group';
		with: [ html label
				for: 'content_input';
				with: 'Contenido'.
			self renderContentInputOn: html ]
]
