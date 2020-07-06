Class {
	#name : #SimpleModalComponent,
	#superclass : #ModalComponent,
	#category : #'Bookflix-UI-resources'
}

{ #category : #callbacks }
SimpleModalComponent >> onAccept [
	self subclassResponsibility
]

{ #category : #rendering }
SimpleModalComponent >> renderAcceptButtonOn: html [
	self subclassResponsibility
]

{ #category : #rendering }
SimpleModalComponent >> renderCancelButtonOn: html [
	html button
		type: 'button';
		class: 'btn btn-secondary';
		attributeAt: 'data-dismiss' put: 'modal';
		with: 'Cancelar'
]

{ #category : #rendering }
SimpleModalComponent >> renderFooterContentOn: html [
	self
		renderCancelButtonOn: html;
		renderAcceptButtonOn: html
]

{ #category : #rendering }
SimpleModalComponent >> renderHeaderContentOn: html [
	html heading level5
		class: 'modal-title';
		id: labelId;
		with: self title.
	super renderHeaderContentOn: html
]

{ #category : #getting }
SimpleModalComponent >> title [
	self subclassResponsibility
]
