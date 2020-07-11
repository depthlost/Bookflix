Class {
	#name : #ModalAnchorComponent,
	#superclass : #ModalTriggerComponent,
	#category : #'Bookflix-UI-resources'
}

{ #category : #rendering }
ModalAnchorComponent >> renderContentOn: html [
	html anchor
		class: class;
		style: style;
		url: '';
		attributeAt: 'data-toggle' put: 'modal';
		attributeAt: 'data-target' put: '#' , modal id;
		with: content.
	html render: modal
]
