Class {
	#name : #ModalComponent,
	#superclass : #WAComponent,
	#instVars : [
		'id',
		'labelId'
	],
	#category : #'Bookflix-UI-resources'
}

{ #category : #'instance creation' }
ModalComponent class >> id: anId [
	^ self new id: anId labelId: anId , '_label'
]

{ #category : #'instance creation' }
ModalComponent class >> id: anId labelId: aLabelId [
	^ self new id: anId labelId: aLabelId
]

{ #category : #accessing }
ModalComponent >> id [
	^ id
]

{ #category : #initialization }
ModalComponent >> id: anId labelId: aLabelId [
	id := anId.
	labelId := aLabelId
]

{ #category : #initialization }
ModalComponent >> initialize [
	id := 'modal_' , self hash asString.
	labelId := 'modal_label_' , self hash asString
]

{ #category : #rendering }
ModalComponent >> renderBodyContentOn: html [
	
]

{ #category : #rendering }
ModalComponent >> renderBodyOn: html [
	html div
		class: 'modal-body text-left';
		with: [ self renderBodyContentOn: html ]
]

{ #category : #rendering }
ModalComponent >> renderContentOn: html [
	html div
		id: id;
		class: 'modal fade';
		attributeAt: 'tabindex' put: '-1';
		attributeAt: 'role' put: 'dialog';
		attributeAt: 'aria-labelledby' put: labelId;
		attributeAt: 'aria-hidden' put: 'true';
		with: [ html div
				class: 'modal-dialog';
				attributeAt: 'role' put: 'document';
				with: [ self renderModalContentOn: html ] ]
]

{ #category : #rendering }
ModalComponent >> renderFooterContentOn: html [
	
]

{ #category : #rendering }
ModalComponent >> renderFooterOn: html [
	html div
		class: 'modal-footer';
		with: [ self renderFooterContentOn: html ]
]

{ #category : #rendering }
ModalComponent >> renderHeaderContentOn: html [
	html button
		type: 'button';
		class: 'close';
		attributeAt: 'data-dismiss' put: 'modal';
		attributeAt: 'aria-label' put: 'Cerrar';
		with: [ html span
				attributeAt: 'aria-hidden' put: 'true';
				with: [ html html: '&times;' ] ]
]

{ #category : #rendering }
ModalComponent >> renderHeaderOn: html [
	html div
		class: 'modal-header';
		with: [ self renderHeaderContentOn: html ]
]

{ #category : #rendering }
ModalComponent >> renderModalContentElementsOn: html [
	self
		renderHeaderOn: html;
		renderBodyOn: html;
		renderFooterOn: html
]

{ #category : #rendering }
ModalComponent >> renderModalContentOn: html [
	html div
		class: 'modal-content';
		with: [ self renderModalContentElementsOn: html ]
]
