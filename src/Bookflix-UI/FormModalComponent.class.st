Class {
	#name : #FormModalComponent,
	#superclass : #SimpleModalComponent,
	#category : #'Bookflix-UI-resources'
}

{ #category : #rendering }
FormModalComponent >> renderAcceptButtonOn: html [
	html button
		type: 'submit';
		class: 'btn btn-primary';
		callback: [ self onAccept ];
		with: 'Aceptar'
]

{ #category : #rendering }
FormModalComponent >> renderModalContentElementsOn: html [
	html form: [ super renderModalContentElementsOn: html ]
]
