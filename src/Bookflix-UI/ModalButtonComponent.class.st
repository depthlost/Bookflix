Class {
	#name : #ModalButtonComponent,
	#superclass : #ModalTriggerComponent,
	#category : #'Bookflix-UI-resources'
}

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
