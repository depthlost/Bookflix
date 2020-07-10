Class {
	#name : #RemoveReadableModalComponent,
	#superclass : #RemoveModalComponent,
	#instVars : [
		'readable'
	],
	#category : #'Bookflix-UI-readables'
}

{ #category : #'instance creation' }
RemoveReadableModalComponent class >> with: aReadable [
	^ self new with: aReadable
]

{ #category : #private }
RemoveReadableModalComponent >> deletionSuccessMessage [
	^ 'Se elimino "' , readable title , '" con exito'
]

{ #category : #callbacks }
RemoveReadableModalComponent >> onAccept [
	self removeReadable.
	self session mainComponent content
		addAlert: (AlertComponent with: self deletionSuccessMessage)
]

{ #category : #callbacks }
RemoveReadableModalComponent >> removeReadable [
	self subclassResponsibility
]

{ #category : #rendering }
RemoveReadableModalComponent >> renderBodyContentOn: html [
	html paragraph: '¿Seguro que deseas borrar "' , readable title , '"?'
]

{ #category : #getting }
RemoveReadableModalComponent >> title [
	^ 'Borrar "' , readable title , '"'
]

{ #category : #initialization }
RemoveReadableModalComponent >> with: aReadable [
	readable := aReadable
]
