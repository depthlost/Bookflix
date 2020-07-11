Class {
	#name : #RemoveBookModalComponent,
	#superclass : #RemoveReadableModalComponent,
	#category : #'Bookflix-UI-readables'
}

{ #category : #private }
RemoveBookModalComponent >> deletionSuccessMessage [
	| message |
	message := 'Se elimino "' , readable title , '"'.
	self hasTrailer
		ifTrue: [ :advance | message := message , ' y "' , advance title , '"' ].
	message := message , ' con exito'.
	^ message
]

{ #category : #private }
RemoveBookModalComponent >> hasTrailer [
	^ readable advance isNotNil
]

{ #category : #callbacks }
RemoveBookModalComponent >> removeReadable [
	Bookflix instance removeBook: readable
]

{ #category : #rendering }
RemoveBookModalComponent >> renderBodyContentOn: html [
	super renderBodyContentOn: html.
	self hasTrailer
		ifTrue: [ html small
				class: 'text-muted';
				with: 'Tambien se eliminara el trailer "' , readable advance title , '"' ]
]
