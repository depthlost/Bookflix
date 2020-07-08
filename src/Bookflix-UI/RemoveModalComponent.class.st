Class {
	#name : #RemoveModalComponent,
	#superclass : #AnchorModalComponent,
	#category : #'Bookflix-UI-resources'
}

{ #category : #rendering }
RemoveModalComponent >> renderAcceptButtonOn: html [
	html anchor
		class: 'btn btn-danger';
		callback: [ self onAccept ];
		with: 'Borrar'
]
