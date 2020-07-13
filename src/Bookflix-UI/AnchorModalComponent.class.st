Class {
	#name : #AnchorModalComponent,
	#superclass : #SimpleModalComponent,
	#category : #'Bookflix-UI-resources'
}

{ #category : #rendering }
AnchorModalComponent >> renderAcceptButtonOn: html [
	html anchor
		class: 'btn btn-primary';
		callback: [ self onAccept ];
		with: 'Aceptar'
]
